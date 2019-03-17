import React, { useState, useRef, useEffect } from "react";
import ReactDataSheet from "react-datasheet";
import "react-datasheet/lib/react-datasheet.css";

//style component
import { Row, Column } from "../../style/grid";
import { TextBox, Button } from "../../style/form";

//local
import Selection from "../../Common/Selection";
import { useFormInput, useFormInputSelection } from "../../Common/FormHooks";

//private
import "./../style.css";
import {RecalculateRow} from "./util";
import {AmountFormatter, PurchaseGridOneCell} from "./GridComponents"
import {Menu, Option} from "./ProductSelectionDropDownComponents";
//---------------------------------------------------------------------------------------------------------------------------------------------------------


//if any changes happen on thease columns, that row should be re-calculated
//like, Qty. if any changes on Qty column, then amount should be re-calculated with QtyxMrp
const RecalculateColumns = ["qty", "mrp"];


//---------------------------------------------------------------------------------------------------------------------------------------------------------

export default function PurchaseForm(props) {
  const billNoField = useFormInput(props.data.billno);
  const dateField = useFormInput(props.data.bill_date);
  const supplierField = useFormInputSelection({
    id: props.data.supplier_id,
    name: props.data.supplier.name
  });
  const [purchaseGrid, setPurchaseGrid] = useState(props.data.purchase_grids);
  const [amount, setAmount] = useState(props.data.amount);
  const discountPercentageField = useFormInput(props.data.discount_percentage);
  const [discountAmount, setDiscountAmount] = useState(props.data.discount_amount);
  const [total, setTotal] = useState(props.data.tot);

  const [selectedRowCol, setSelectedRowCol] = useState({
    start: { i: 0, j: 0 },
    end: { i: 0, j: 0 }
  });

  //------------- element ref
  const inputElementBillNo = useRef(null);
  const inputElementDate = useRef(null);
  const inputElementSupplier = useRef(null);
  const inputElementDiscountPercentage = useRef(null);
  const inputElementSubmit = useRef(null);

  const isFirstRun = useRef(true);

  //add all elements into array, so that will move next
  let currentFocusElementIndex = 0;
  const AllInputElements = [
    inputElementBillNo,
    inputElementDate,
    inputElementSupplier,
    inputElementDiscountPercentage,
    inputElementSubmit
  ];

  function GenerateGrid() {
    const gridValues = purchaseGrid.map((pg, i) => {
      const oneRow = [];
      //srno
      oneRow.push({ name: "srno", readOnly: true, value: pg.srno });

      //don't confuse DataSheet's {value, component} with Select control's {label, value}
      //product selection
      oneRow.push({
        name: "product_name",
        value: pg.product.name,
        component: GenerateProductDropDownForGrid({
          srno: pg.srno,
          value: pg.product.id,
          label: pg.product.name
        })
      });

      //qty
      oneRow.push({ name: "qty", value: pg.qty });

      //mrp
      oneRow.push({
        name: "mrp",
        value: pg.mrp,
        valueViewer: AmountFormatter
      });

      //qty x mrp
      oneRow.push({ name: "qty_mrp", readOnly: true, value: pg.qty_mrp });

      return oneRow;
    });

    return gridValues;
  }

  function AddMoreRows(e) {
    e.preventDefault();

    const oneNewRow = {
      id: "",
      srno: purchaseGrid.length + 1,
      product: { id: "", name: "" },
      product_id: "",
      qty: "",
      mrp: "",
      qty_mrp: ""
    };

    let purchaseGridCopy = purchaseGrid.map((pg, i) => pg);
    purchaseGridCopy.push(oneNewRow);

    setPurchaseGrid(purchaseGridCopy);
  }

  //re-calculate totalAmount
  function recalculateTotalAmount(pGrid) {
    const amount = pGrid.reduce((a, c) => a + Number(c.qty_mrp), 0);
    const disPercentage = Number(discountPercentageField.value);
    const disAmount = amount * (disPercentage / 100);
    const tot = amount - disAmount;

    setAmount(amount.toFixed(2));
    setDiscountAmount(disAmount.toFixed(2));
    setTotal(tot.toFixed(2));
  }

  //drop down on Grid
  function GenerateProductDropDownForGrid({ srno, value, label }) {
    return (
      <Selection
        autoFocus={true}
        ApiUrl="products/search"
        value={{ value, label }}
        onChange={opt => {
          UpdatePurchaseGridValues(
            srno,
            {
              product: { name: opt.name, id: opt.id },
              mrp: opt.price,
              qty: 1 //1 qty after select drop-down
            },
            true
          );
        }}
        components={{ Menu, Option }}
      />
    );
  }

  //update purchase grid after selecting product or updating cell values
  function UpdatePurchaseGridValues(srno, newValues, needRecalculation) {
    let purchaseGridUpdated = purchaseGrid.map((pg, i) => {
      if (pg.srno === srno) {
        return { ...pg, ...newValues };
      } else {
        return pg;
      }
    });

    if (needRecalculation) {
      purchaseGridUpdated = RecalculateRow(purchaseGridUpdated, srno);
      recalculateTotalAmount(purchaseGridUpdated);
    }

    setPurchaseGrid(purchaseGridUpdated);
  }

  function KeyDownEvent(e) {
    if (e.keyCode === 13) {
      e.preventDefault();
      currentFocusElementIndex++;
      if (AllInputElements[currentFocusElementIndex]) {
        AllInputElements[currentFocusElementIndex].current.focus();
      } else {
        currentFocusElementIndex = 0;
      }
    }
  }

  function handleSubmit(e) {
    
    //remove empty grid items
    const pgItems = purchaseGrid.filter(pg => pg.product.id !== "")

    e.preventDefault();
    const values = {
      billno: billNoField.value,
      bill_date: dateField.value,
      supplier_id: supplierField.value.id,
      purchase_grid: pgItems,
      amount: amount,
      discount_percentage: discountPercentageField.value,
      discount_amount: discountAmount,
      tot: total
    };
    props.SubmitClick(values);
  }

  useEffect(() => {
    //avoid first time to calculate after loading
    //we have to show what is in DB, not the calculated values
    //so, first time show the data from DB and bypass the calculate
    //if user changes and values in textbox then only run the calculation
    if (isFirstRun.current) {
      isFirstRun.current = false;
      return;
    }

    recalculateTotalAmount(purchaseGrid);
  }, [discountPercentageField.value]);

  return (
    <form onSubmit={handleSubmit}>
      <Row>
        <Column span="4">
          <label htmlFor="name">Bill No</label>
          <br />
          <TextBox
            type="text"
            id="billNo"
            name="billNo"
            ref={inputElementBillNo}
            onKeyDown={KeyDownEvent}
            value={billNoField.value}
            onChange={billNoField.onChange}
            required
          />
        </Column>

        <Column span="4">
          <label htmlFor="name">Date</label>
          <br />
          <TextBox
            type="date"
            id="date"
            name="date"
            ref={inputElementDate}
            onKeyDown={KeyDownEvent}
            value={dateField.value}
            onChange={dateField.onChange}
            required
          />
        </Column>

        <Column span="4">
          supplier <br />
          <Selection
            ApiUrl="supplier/search"
            id="category"
            name="category"
            value={{
              value: supplierField.value,
              label: supplierField.value.name
            }}
            Ref={inputElementSupplier}
            onInputKeyDown={KeyDownEvent}
            onChange={supplierField.onChange}
            components={{ Option }}
          />
        </Column>
      </Row>
      <ReactDataSheet
        data={GenerateGrid()}
        valueRenderer={cell => cell.value}
        sheetRenderer={props => (
          <table className={props.className + " purchaseGrid"}>
            <thead>
              <tr>
                <th className="header" width="50px">
                  SrNo
                </th>
                <th className="header">Product</th>
                <th className="header" width="100px">
                  Qty
                </th>
                <th className="header" width="100px">
                  Mrp
                </th>
                <th className="header" width="100px">
                  Qty x Mrp
                </th>
              </tr>
            </thead>
            <tbody>{props.children}</tbody>
          </table>
        )}
        rowRenderer={({ row, cells, children }) => <tr>{children}</tr>}
        onCellsChanged={changes => {
          changes.forEach(({ cell, row, col, value }) => {
            if (cell.name === "product_name") {
              return;
            }
            const recalculationRequired = RecalculateColumns.includes(
              cell.name
            );
            UpdatePurchaseGridValues(
              row + 1,
              { [cell.name]: value },
              recalculationRequired
            );
          });
        }}
        cellRenderer={PurchaseGridOneCell}
        /*selected={{
          start: { i: selectedRowCol.start.i, j: selectedRowCol.start.j },
          end: { i: selectedRowCol.end.i, j: selectedRowCol.end.j }
        }}*/
        //selected={selectedRowCol}
        //onSelect={selected => setSelectedRowCol(selected)}
      />
      
      <Button onClick={AddMoreRows}>Add rows</Button>

      <Row>
        <Column span="3">
          <label htmlFor="amount">Amount</label>
          <br />
          {amount}
        </Column>

        <Column span="3">
          <label htmlFor="discountPercentage">Discount %</label>
          <br />
          <TextBox
            type="number"
            id="discountPercentage"
            name="discountPercentage"
            step="0.01"
            min="0"
            max="9999999"
            ref={inputElementDiscountPercentage}
            onKeyDown={KeyDownEvent}
            value={discountPercentageField.value}
            onChange={discountPercentageField.onChange}
            required
          />
        </Column>

        <Column span="3">
          <label htmlFor="discountAmount">Discount amount</label>
          <br />
          {discountAmount}
        </Column>

        <Column span="3">
          <label htmlFor="total">Total</label>
          <br />
          {total}
        </Column>
      </Row>

      <Row>
        <Button primary type="submit" ref={inputElementSubmit}>
          {props.mode}
        </Button>
      </Row>
    </form>
  );
}

import React, { useState, useRef, useEffect } from "react";
import ReactDataSheet from "react-datasheet";
import "react-datasheet/lib/react-datasheet.css";
import { components } from "react-select";

//style component
import { Row, Column } from "./../style/grid";
import { TextBox, Button } from "./../style/form";

//local
import Selection from "./../Common/Selection";
import { useFormInput, useFormInputSelection } from "./../Common/FormHooks";

//private
import "./style.css";

//---------------------------------------------------------------------------------------------------------------------------------------------------------

//const - Column name
const COL_SRNO = "srno";
const COL_PRODUCT_NAME = "product_name";
const COL_PRODUCT_ID = "product_id";
const COL_QTY = "qty";
const COL_MRP = "mrp";
const COL_QTY_MRP = "qty_mrp";

//bottom part of selection drop-down
const Menu = props => (
  <components.Menu {...props}>{props.children}</components.Menu>
);

const Option = props => (
  <components.Option {...props}>{props.data.name}</components.Option>
);

function AmountFormatter(props) {
  return <div>{props.value}</div>;
}

//re-calculate the row like, Amount = Mrp x Qty
function RecalculateRow(grid, srno) {
  const gridUpdated = grid.map((row, i) => {
    if (row.srno === srno) {
      return { ...row, qty_mrp: row.qty * row.mrp };
    } else {
      return row;
    }
  });
  return gridUpdated;
}

//if any changes happen on thease columns, that row should be re-calculated
//like, Qty. if any changes on Qty column, then amount should be re-calculated with QtyxMrp
const RecalculateColumns = [COL_QTY, COL_MRP];

//---------------------------------------------------------------------------------------------------------------------------------------------------------

export default function PurchaseForm(props) {
  const billNoField = useFormInput(props.data.billno);
  const dateField = useFormInput(props.data.bill_date);
  const supplierField = useFormInputSelection({
    id: props.data.supplier_id,
    name: props.data.supplier.name
  });
  const [purchaseGrid, setPurchaseGrid] = useState([]);
  const amountField = useFormInput(props.data.amount);
  const discountPercentageField = useFormInput(props.data.discount_percentage);
  const discountAmountField = useFormInput(props.data.discount_amount);
  const totalField = useFormInput(props.data.tot);

  //------------- element ref
  const inputElementBillNo = useRef(null);
  const inputElementDate = useRef(null);
  const inputElementSupplier = useRef(null);
  const inputElementAmount = useRef(null);
  const inputElementDiscountPercentage = useRef(null);
  const inputElementDiscountAmount = useRef(null);
  const inputElementTotal = useRef(null);
  const inputElementSubmit = useRef(null);

  //add all elements into array, so that will move next
  let currentFocusElementIndex = 0;
  const AllInputElements = [
    inputElementBillNo,
    inputElementDate,
    inputElementSupplier,
    inputElementAmount,
    inputElementDiscountPercentage,
    inputElementDiscountAmount,
    inputElementTotal,
    inputElementSubmit
  ];

  function GenerateGrid() {
    const gridValues = purchaseGrid.map((pg, i) => {
      const oneRow = [];
      //srno
      oneRow.push({ name: COL_SRNO, readOnly: true, value: pg.srno });

      //don't confuse DataSheet's {value, component} with Select control's {label, value}
      //product selection
      oneRow.push({
        name: COL_PRODUCT_NAME,
        value: pg.product_name,
        component: GenerateProductDropDownForGrid({
          srno: pg.srno,
          value: pg.product_id,
          label: pg.product_name
        })
      });

      //qty
      oneRow.push({ name: COL_QTY, value: pg.qty });

      //mrp
      oneRow.push({
        name: COL_MRP,
        value: pg.mrp,
        valueViewer: AmountFormatter
      });

      //qty x mrp
      oneRow.push({ name: COL_QTY_MRP, readOnly: true, value: pg.qty_mrp });

      return oneRow;
    });

    return gridValues;
  }

  function AddMoreRows(e) {
    e.preventDefault();

    const oneNewRow = {
      [COL_SRNO]: purchaseGrid.length + 1,
      [COL_PRODUCT_NAME]: "",
      [COL_PRODUCT_ID]: "",
      [COL_QTY]: "",
      [COL_MRP]: "",
      [COL_QTY_MRP]: ""
    };

    let purchaseGridCopy = purchaseGrid.map((pg, i) => pg);
    purchaseGridCopy.push(oneNewRow);

    setPurchaseGrid(purchaseGridCopy);
  }

  //re-calculate totalAmount
  function recalculateTotalAmount(pGrid) {
    const amount = pGrid.reduce((a, c) => a + c.qty_mrp, 0);
    const disPercentage = Number(discountPercentageField.value);
    const disAmount = amount * (disPercentage / 100);
    const tot = amount - disAmount;

    amountField.setValue(amount);
    discountAmountField.setValue(disAmount);
    totalField.setValue(tot);
  }

  //drop down on Grid
  function GenerateProductDropDownForGrid({ srno, value, label }) {
    return (
      <Selection
        ApiUrl="products/search"
        value={{ value, label }}
        onChange={opt => {
          UpdatePurchaseGridValues(
            srno,
            {
              product_name: opt.name,
              product_id: opt.id,
              mrp: opt.price,
              qty: 1 //1 qty after select drop-down
            },
            true
          );
        }}
        components={{ Menu, Option }}
      />
      /*<Select
        autofocus
        openOnFocus
        closeOnSelect
        value={{ value, label }}
        onChange={opt =>
          UpdatePurchaseGridValues(srno, {
            product_name: opt.label,
            product_id: opt.value
          })
        }
        options={options}
        components={{ Menu, Option }}
      />*/
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
    e.preventDefault();
    const values = {
      billno: billNoField.value,
      bill_date: dateField.value,
      supplier_id: supplierField.value.id,
      purchase_grid: purchaseGrid,
      amount: amountField.value,
      discount_percentage: discountPercentageField.value,
      discount_amount: discountAmountField.value,
      tot: totalField.value
    };
    props.SubmitClick(values);
  }

  useEffect(() => {
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
                <th className="header">SrNo</th>
                <th className="header">Product</th>
                <th className="header">Qty</th>
                <th className="header">Mrp</th>
                <th className="header">Qty x Mrp</th>
              </tr>
            </thead>
            <tbody>{props.children}</tbody>
          </table>
        )}
        rowRenderer={({ row, cells, children }) => <tr>{children}</tr>}
        onCellsChanged={changes => {
          changes.forEach(({ cell, row, col, value }) => {
            if (cell.name === COL_PRODUCT_NAME) {
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
      />
      <button onClick={AddMoreRows}>Add rows</button>

      <Row>
        <Column span="3">
          <label htmlFor="amount">Amount</label>
          <br />
          <TextBox
            type="number"
            id="amount"
            name="amount"
            ref={inputElementAmount}
            onKeyDown={KeyDownEvent}
            value={amountField.value}
            onChange={amountField.onChange}
            required
          />
        </Column>

        <Column span="3">
          <label htmlFor="discountPercentage">Discount %</label>
          <br />
          <TextBox
            type="number"
            id="discountPercentage"
            name="discountPercentage"
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
          <TextBox
            type="number"
            id="discountAmount"
            name="discountAmount"
            ref={inputElementDiscountAmount}
            onKeyDown={KeyDownEvent}
            value={discountAmountField.value}
            onChange={discountAmountField.onChange}
            required
          />
        </Column>

        <Column span="3">
          <label htmlFor="total">Total</label>
          <br />
          <TextBox
            type="number"
            id="total"
            name="total"
            ref={inputElementTotal}
            onKeyDown={KeyDownEvent}
            value={totalField.value}
            onChange={totalField.onChange}
            required
          />
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

import React, { useState } from "react";
import ReactDataSheet from "react-datasheet";
import "react-datasheet/lib/react-datasheet.css";
import Select, { components } from "react-select";

//style component
import { Row, Column } from "./../style/grid";

//private
//import ProductSelection from "./ProductSelection"
import "./style.css";

const groupStyles = {
  width: 300,
  background: "white"
};

const Menu = props => (
  <components.Menu {...props}>
    <div style={groupStyles}>{props.children}</div>
  </components.Menu>
);

const options = [
  { label: "Bread", value: 1 },
  { label: "Berries", value: 2 },
  { label: "Milk", value: 3 },
  { label: "Apples", value: 4 },
  { label: "Chicken", value: 5 },
  { label: "Yoghurt", value: 6 },
  { label: "Onions", value: 7 },
  { label: "Salad", value: 8 }
];

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
const RecalculateColumns = ["qty", "mrp"];

export default function Purchase() {
  const [purchaseGrid, setPurchaseGrid] = useState([
    {
      srno: 1,
      product_name: "Apples",
      product_id: 4,
      qty: 1,
      mrp: 65.5,
      qty_mrp: 65.5
    },
    {
      srno: 2,
      product_name: "Salad",
      product_id: 8,
      qty: 2,
      mrp: 45,
      qty_mrp: 90
    }
  ]);

  function GenerateGrid() {
    const gridValues = purchaseGrid.map((pg, i) => {
      const oneRow = [];
      //srno
      oneRow.push({ name: "srno", readOnly: true, value: pg.srno });

      //don't confuse DataSheet's {value, component} with Select control's {label, value}
      //product selection
      oneRow.push({
        name: "product_name",
        value: pg.product_name,
        component: ProductSelectComponent({
          srno: pg.srno,
          value: pg.product_id,
          label: pg.product_name
        })
      });

      //qty
      oneRow.push({ name: "qty", value: pg.qty });

      //mrp
      oneRow.push({ name: "mrp", value: pg.mrp, valueViewer: AmountFormatter });

      //qty x mrp
      oneRow.push({ name: "qty_mrp", readOnly: true, value: pg.qty_mrp });

      return oneRow;
    });

    return gridValues;
  }

  function AddMoreRows() {
    const oneNewRow = {
      srno: purchaseGrid.length + 1,
      product_name: "",
      product_id: "",
      qty: "",
      mrp: "",
      qty_mrp: ""
    };

    let purchaseGridCopy = purchaseGrid.map((pg, i) => pg);
    purchaseGridCopy.push(oneNewRow);

    setPurchaseGrid(purchaseGridCopy);
  }

  function ProductSelectComponent({ srno, value, label }) {
    return (
      <Select
        autofocus
        openOnFocus
        closeOnSelect
        value={{ value, label }}
        onChange={opt =>
          UpdateProductGridValues(srno, {
            product_name: opt.label,
            product_id: opt.value
          })
        }
        options={options}
        components={{ Menu }}
      />
    );
  }

  function UpdateProductGridValues(srno, newValues, needRecalculation) {
    let purchaseGridUpdated = purchaseGrid.map((pg, i) => {
      if (pg.srno === srno) {
        return { ...pg, ...newValues };
      } else {
        return pg;
      }
    });

    if (needRecalculation) {
      purchaseGridUpdated = RecalculateRow(purchaseGridUpdated, srno);
    }

    setPurchaseGrid(purchaseGridUpdated);
  }

  return (
    <div>
      <Row>
        <Column span="4">
          Bill No <br />
          <input type="text" />
        </Column>

        <Column span="4">
          Date <br />
          <input type="date" />
        </Column>

        <Column span="4">
          supplier <br />
          <input type="text" />
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
            if (cell.name === "product_name") {
              return;
            }
            const recalculationRequired = RecalculateColumns.includes(
              cell.name
            );
            UpdateProductGridValues(
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
          Amount <br />
          <input type="number" />
        </Column>

        <Column span="3">
          Discount % <br />
          <input type="number" />
        </Column>

        <Column span="3">
          Discount amount <br />
          <input type="number" />
        </Column>

        <Column span="3">
          Total <br />
          <input type="number" />
        </Column>
      </Row>
    </div>
  );
}

import React, { useState } from "react";
import ReactDataSheet from "react-datasheet";
import "react-datasheet/lib/react-datasheet.css";
import Select from "react-select";

//style component
import { Row, Column } from "./../style/grid";

//private
//import ProductSelection from "./ProductSelection"
import "./style.css";

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
  /*const [gridValue, setGridValue] = useState([
    [{ readOnly: true, value: "1" }, { value: "", dataEditor: ProductSelection },{ value: 0 }, { value: 0 }, { value: 0 }],
    [{ readOnly: true, value: "2" }, { value: "", dataEditor: ProductSelection },{ value: 0 }, { value: 0 }, { value: 0 }]
  ]);*/

  function GenerateGrid() {
    const gridValues = purchaseGrid.map((pg, i) => {
      const oneRow = [];

      //srno
      oneRow.push({ readOnly: true, value: pg.srno });

      //don't confuse DataSheet's {value, etc...} with Select control's {label, value}
      //product selection
      oneRow.push({
        value: pg.product_name,
        component: ProductSelectComponent({
          srno: pg.srno,
          value: pg.product_id,
          label: pg.product_name
        })
      });

      //qty
      oneRow.push({ value: pg.qty });

      //mrp
      oneRow.push({ value: pg.mrp });

      //qty x mrp
      oneRow.push({ value: pg.qty_mrp });

      return oneRow;
    });

    return gridValues;
  }

  function ProductSelectComponent({ srno, value, label }) {
    return (
      <Select
        autofocus
        openOnFocus
        closeOnSelect
        value={{ value, label }}
        onChange={opt => ProductSelected(srno, opt)}
        options={options}
      />
    );
  }

  function ProductSelected(srno, opt) {
    const purchaseGridUpdated = purchaseGrid.map((pg, i) => {
      if (pg.srno === srno) {
        return { ...pg, product_name: opt.label, product_id: opt.value };
      } else {
        return pg;
      }
    });
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
        onChange={() => {}}
        /*onCellsChanged={changes => {
          const grid = gridValue.map(row => [...row]);
          changes.forEach(({ cell, row, col, value }) => {
            grid[row][col] = { ...grid[row][col], value };
          });
          setGridValue(grid);
        }}*/
      />

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

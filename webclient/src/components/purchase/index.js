import React, { useState } from "react";
import ReactDataSheet from "react-datasheet";
import "react-datasheet/lib/react-datasheet.css";

//style component
import { Row, Column } from "./../style/grid";

//private
import "./style.css";

export default function Purchase() {
  const [gridValue, setGridValue] = useState([
    [{ readOnly: true, value: "" }, { value: 0 },{ value: 0 }, { value: 0 }, { value: 0 }],
    [{ readOnly: true, value: "" }, { value: 0 },{ value: 0 }, { value: 0 }, { value: 0 }]
  ]);

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
        data={gridValue}
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
        rowRenderer={ ({row, cells, children}) => (
          <tr>
            {children}
          </tr>
        )}
        onCellsChanged={changes => {
          const grid = gridValue.map(row => [...row]);
          changes.forEach(({ cell, row, col, value }) => {
            grid[row][col] = { ...grid[row][col], value };
          });
          setGridValue(grid);
        }}
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

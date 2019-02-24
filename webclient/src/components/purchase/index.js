import React, { useState } from "react";

//style component
import { Row, Column } from "./../style/grid";
import { Button } from "./../style/form";

export default function Purchase() {
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
      GRID
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

import React, { useEffect, useState } from "react";

//style component
import { Row, Column } from "./../style/grid";

export default function ProductView(props) {
  return (
    <React.Fragment>
      <Row>
        <Column span="3">Name</Column>
        <Column span="9">{props.name}</Column>
      </Row>
      <Row>
        <Column span="3">Category</Column>
        <Column span="9">{props.category.name}</Column>
      </Row>
      <Row>
        <Column span="3">Price</Column>
        <Column span="9">{props.price}</Column>
      </Row>
      <Row>
        <Column span="3">Size</Column>
        <Column span="9">{props.size}</Column>
      </Row>
      <Row>
        <Column span="3">Is Expiry</Column>
        <Column span="9">{props.is_expiry}</Column>
      </Row>
      <Row>
        <Column span="3">Expiry date</Column>
        <Column span="9">{props.expiry_date}</Column>
      </Row>
      <Row>
        <Column span="3">Description</Column>
        <Column span="9">{props.description}</Column>
      </Row>
    </React.Fragment>
  );
}

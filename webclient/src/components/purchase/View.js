import React, { useEffect, useReducer } from "react";

//style component
import { Row, Column } from "../style/grid";
import { Table } from "./../style/table";

//State management components
import reducerMiddleware from "./State/reducerMiddleware";
import reducer from "./State/reducer";
import { initialState } from "./State/initialState";
import { LOAD_INIT } from "./State/actionTypes";
import { load } from "./State/actionCreator";

export default function ProductView({ match }) {
  const [state, dispatchBase] = useReducer(reducer, initialState);
  const dispatch = reducerMiddleware(dispatchBase);

  useEffect(() => {
    dispatch({ type: LOAD_INIT });
    dispatch(load(match.params.id));
  }, [match.params.id]);

  return (
    <React.Fragment>
    <Row>
      <Column span="3">Bill No</Column>
      <Column span="9">{state.billno}</Column>
    </Row>
    <Row>
      <Column span="3">Date</Column>
      <Column span="9">{state.bill_date}</Column>
    </Row>
    <Row>
      <Column span="3">Supplier</Column>
      <Column span="9">{state.supplier.name}</Column>
    </Row>
    <Row>
      <Table>
        <thead>
          <tr>
            <th>SrNo</th>
            <th>Product</th>
            <th>Mrp</th>
            <th>Qty</th>
            <th>Mrp x Qty</th>
          </tr>
        </thead>
        <tbody>
          {state.purchase_grids.map(item => (
            <tr key={item.srno}>
              <td>{item.srno}</td>
              <td>{item.product.name}</td>
              <td>{item.mrp}</td>
              <td>{item.qty}</td>
              <td>{item.qty_mrp}</td>
            </tr>
          ))}
        </tbody>
      </Table>
    </Row>
    <Row>
      <Column span="3">Amount</Column>
      <Column span="9">{state.amount}</Column>
    </Row>
    <Row>
      <Column span="3">Discount %</Column>
      <Column span="9">{state.discount_percentage}</Column>
    </Row>
    <Row>
      <Column span="3">Discount</Column>
      <Column span="9">{state.discount_amount}</Column>
    </Row>
    <Row>
      <Column span="3">Total</Column>
      <Column span="9">{state.tot}</Column>
    </Row>
  </React.Fragment>
  );
}

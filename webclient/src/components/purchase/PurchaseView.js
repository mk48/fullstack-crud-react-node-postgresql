import React, { useEffect } from "react";

//style component
import { Row, Column } from "./../style/grid";
import { Table } from "./../style/table";

//local
import useDataApi from "../Common/DataApi/useDataApi";

export default function PurchaseView({ match }) {
  const getPurchaseApi = useDataApi("get", "purchase", null);

  useEffect(() => {
    getPurchaseApi.fetchData({ id: match.params.PurchaseId });
  }, [match.params.PurchaseId]);

  const data = getPurchaseApi.data;

  //console.log("Loading --> " + getPurchaseApi.loading );

  return getPurchaseApi.loading || !data ? (
    <div>loading...</div>
  ) : (
    <React.Fragment>
      <Row>
        <Column span="3">Bill No</Column>
        <Column span="9">{data.billno}</Column>
      </Row>
      <Row>
        <Column span="3">Date</Column>
        <Column span="9">{data.bill_date}</Column>
      </Row>
      <Row>
        <Column span="3">Supplier</Column>
        <Column span="9">{data.supplier.name}</Column>
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
            {data.purchase_grids.map(item => (
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
        <Column span="9">{data.amount}</Column>
      </Row>
      <Row>
        <Column span="3">Discount %</Column>
        <Column span="9">{data.discount_percentage}</Column>
      </Row>
      <Row>
        <Column span="3">Discount</Column>
        <Column span="9">{data.discount_amount}</Column>
      </Row>
      <Row>
        <Column span="3">Total</Column>
        <Column span="9">{data.tot}</Column>
      </Row>
    </React.Fragment>
  );
}

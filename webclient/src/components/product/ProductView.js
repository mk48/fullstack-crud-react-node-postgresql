import React, { useEffect } from "react";

//style component
import { Row, Column } from "./../style/grid";

//local
import useDataApi from "../Common/DataApi/useDataApi";

export default function ProductView(props) {
  const getProductApi = useDataApi("get", "products", null);

  useEffect(() => {
    getProductApi.fetchData({ id: props.ProductId });
  }, [props.ProductId]);

  const data = getProductApi.data;

  //console.log("Loading --> " + getProductApi.loading );

  return getProductApi.loading || !data ? (
    <div>loading...</div>
  ) : (
    <React.Fragment>
      <Row>
        <Column span="3">Name</Column>
        <Column span="9">{data.name}</Column>
      </Row>
      <Row>
        <Column span="3">Category</Column>
        <Column span="9">{data.category.name}</Column>
      </Row>
      <Row>
        <Column span="3">Price</Column>
        <Column span="9">{data.price}</Column>
      </Row>
      <Row>
        <Column span="3">Size</Column>
        <Column span="9">{data.size}</Column>
      </Row>
      <Row>
        <Column span="3">Is Expiry</Column>
        <Column span="9">{data.is_expiry && "✓"}</Column>
      </Row>
      <Row>
        <Column span="3">Expiry date</Column>
        <Column span="9">{data.expiry_date}</Column>
      </Row>
      <Row>
        <Column span="3">Description</Column>
        <Column span="9">{data.description}</Column>
      </Row>
    </React.Fragment>
  );
}

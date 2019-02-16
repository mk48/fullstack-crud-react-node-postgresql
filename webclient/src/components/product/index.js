import React, { useEffect, useState } from "react";

//Libs
import axios from "axios";

//style component
import { Row, Column } from "./../style/grid";

//local
import useDataApi from "../Common/DataApi/useDataApi";

//Private
//import ProductForm from "./ProductForm";
import ProductList from "./ProductList";

export default function Product() {
  const [selectedProductId, setSelectedProductId] = useState(0);
  const apiProduct = useDataApi("get", "products", {});

  const ViewProduct = id => {
    setSelectedProductId(id);
    apiProduct.fetchData({id: id});
  };

  return (
    <Row>
      <Column span="3">here another: {apiProduct.data.name}</Column>
      <Column span="9">
        <ProductList ViewClick={ViewProduct} />
      </Column>
      {/* <ProductForm SubmitClick={this.SaveProduct} /> */}
    </Row>
  );
}
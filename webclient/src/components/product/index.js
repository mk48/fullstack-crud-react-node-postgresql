import React, { useEffect, useState } from "react";

//Libs

//style component
import { Row, Column } from "./../style/grid";

//local
import useDataApi from "../Common/DataApi/useDataApi";

//Private
import ProductView from "./ProductView";
import ProductList from "./ProductList";
import ProductForm from "./ProductForm";

export default function Product() {
  const [selectedProductId, setSelectedProductId] = useState(0);
  const [mode, setMode] = useState("");
  const getProductApi = useDataApi("get", "products", {});

  const ViewProduct = id => {
    setMode("view");
    setSelectedProductId(id);
    getProductApi.fetchData({ id: id });
  };

  const EditProduct = id => {
    setMode("edit");
    setSelectedProductId(id);
    getProductApi.fetchData({ id: id });
  };

  const SaveProduct = () => {

  }

  let View = null;
  if (selectedProductId !== 0 && !getProductApi.loading) {
    if (mode === "edit") {
      View = <ProductForm {...getProductApi.data} SubmitClick={SaveProduct} />
    } else if (mode === "view") {
      View = <ProductView {...getProductApi.data} />;
    }
  } else {
    View = <div>"select" </div>;
  }

  return (
    <Row>
      <Column span="4">
        {View }
      </Column>
      <Column span="8">
        <ProductList ViewClick={ViewProduct} EditClick={EditProduct} />
      </Column>
    </Row>
  );
}

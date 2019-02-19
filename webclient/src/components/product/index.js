import React, { useState } from "react";

//Libs

//style component
import { Row, Column } from "./../style/grid";

//local
import useDataApi from "../Common/DataApi/useDataApi";

//Private
import ProductView from "./ProductView";
import ProductList from "./ProductList";
import ProductForm from "./ProductForm";

const date = new Date();
const fullDate =
  date.getFullYear() + "-" + date.getMonth() + 1 + "-" + date.getDate();

const initialData = {
  name: "",
  price: 0,
  size: 1,
  is_expiry: false,
  expiry_date: fullDate,
  description: "",
  category_id: "",
  category: { name: "" }
};

export default function Product() {
  const [selectedProductId, setSelectedProductId] = useState(0);
  const [mode, setMode] = useState("");
  const getProductApi = useDataApi("get", "products", {});
  const saveProductApi = useDataApi("post", "products", {});
  const updateProductApi = useDataApi("post", "products/update", {});

  const ChangeModeToView = id => {
    setMode("view");
    setSelectedProductId(id);
    getProductApi.fetchData({ id: id });
  };

  const ChangeModeToEdit = id => {
    setMode("edit");
    setSelectedProductId(id);
    getProductApi.fetchData({ id: id });
  };

  const ChangeModeToAdd = () => {
    setMode("new");
  };

  const SaveProduct = async data => {
    await saveProductApi.fetchData(data);
  };

  const UpdateProduct = async data => {
    await updateProductApi.fetchData({ ...data, id: selectedProductId });
  };

  let View = null;

  if (mode === "new") {
    View = (
      <ProductForm
        key={mode}
        mode="new"
        {...initialData}
        SubmitClick={SaveProduct}
      />
    );
  } else if (selectedProductId !== 0 && !getProductApi.loading) {
    if (mode === "edit") {
      View = (
        <ProductForm
          key={mode}
          mode="edit"
          {...getProductApi.data}
          SubmitClick={UpdateProduct}
        />
      );
    } else if (mode === "view") {
      View = <ProductView {...getProductApi.data} />;
    }
  } else {
    View = <div>"select" </div>;
  }

  return (
    <React.Fragment>
      <Row>
        <Column span="4">
          <button onClick={ChangeModeToAdd}>Add new</button>
        </Column>
      </Row>
      <Row>
        <Column span="4">{View}</Column>
        <Column span="8">
          <ProductList
            ViewClick={ChangeModeToView}
            EditClick={ChangeModeToEdit}
          />
        </Column>
      </Row>
    </React.Fragment>
  );
}

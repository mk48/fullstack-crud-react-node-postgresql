import React, { useState, useEffect } from "react";

//local
import useDataApi from "../Common/DataApi/useDataApi";

//private
import ProductForm from "./ProductForm";

const date = new Date();
const fullDate =
  date.getFullYear() + "-" + date.getMonth() + 1 + "-" + date.getDate();

const InitialData = {
  name: "",
  price: 0,
  size: 1,
  is_expiry: false,
  expiry_date: fullDate,
  description: "",
  category_id: "",
  category: { name: "" }
};

export default function ProductFormNew(props) {
  const [data, setData] = useState(InitialData);
  const [lastUpdate, setLastUpdate] = useState(date);
  const [isSuccess, setIsSuccess] = useState(false);
  const saveProductApi = useDataApi("post", "products", {});

  const SaveProduct = async data => {
    setIsSuccess(false);
    await saveProductApi.fetchData(data);
    setData({...InitialData});
    setIsSuccess(true);
    setLastUpdate(new Date());
  };

  return (
    <React.Fragment>
      <ProductForm key={lastUpdate} mode="new" data={data} SubmitClick={SaveProduct} />
      {saveProductApi.loading && <div>Adding...</div>}
      {saveProductApi.isError && <div>Error occured while saving...</div>}
      {isSuccess && (
        <div>
          Product saved successfully, you can continue adding new products.
        </div>
      )}
    </React.Fragment>
  );
}

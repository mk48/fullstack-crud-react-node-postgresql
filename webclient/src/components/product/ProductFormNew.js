import React, { useState, useCallback } from "react";

//local
import useDataApi from "../Common/DataApi/useDataApi";
import { Today } from "./../../util/date";

//private
import ProductForm from "./ProductForm";

const InitialData = {
  name: "",
  price: 0,
  size: 1,
  is_expiry: false,
  expiry_date: Today(),
  description: "",
  category_id: "",
  category: { name: "" }
};

export default function ProductFormNew() {
  const [data, setData] = useState(InitialData);
  const [lastUpdate, setLastUpdate] = useState(Today());
  const [isSuccess, setIsSuccess] = useState(false);
  const saveProductApi = useDataApi("post", {});

  console.log("Rendering...");

  const SaveProduct = useCallback(
    async data => {
      console.log("SaveProduct()...");
      setIsSuccess(false);
      console.log("after setSuccess(false)...");

      try {
        setIsSuccess(false);
        console.log("api...");
        await saveProductApi.doFetch("products", data);
        console.log("api done...");
        setData({ ...InitialData });
        setIsSuccess(true);
        setLastUpdate(new Date());
        console.log("apid done 2...");
      } catch (e) {
        //what ever need to be done will be done in the render (below methods)
      }

      console.log("saveproduct() done...");
    },
    [data]
  );

  return (
    <React.Fragment>
      <ProductForm
        key={lastUpdate}
        mode="new"
        data={data}
        SubmitClick={SaveProduct}
      />
      {saveProductApi.isLoading && <div>Adding...</div>}
      {saveProductApi.isError && <div>Error occured while saving...</div>}
      {isSuccess && (
        <div>
          Product saved successfully, you can continue adding new products.
        </div>
      )}
    </React.Fragment>
  );
}

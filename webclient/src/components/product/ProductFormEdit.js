import React, { useState, useEffect } from "react";

//local
import useDataApi from "../Common/DataApi/useDataApi";

//private
import ProductForm from "./ProductForm";

export default function ProductFormEdit({match}) {
  const [isSuccess, setIsSuccess] = useState(false);
  const getProductApi = useDataApi("get", null);
  const updateProductApi = useDataApi("post",  {});

  useEffect(() => {
    getProductApi.doFetch("products", { id: match.params.ProductId });
  }, [match.params.ProductId]);

  const UpdateProduct = async data => {
    await updateProductApi.doFetch("products/update", { ...data, id: match.params.ProductId });
    setIsSuccess(true);
  };

  const data = getProductApi.data;

  return getProductApi.isLoading || !data ? (
    <div>loading...</div>
  ) : (
    <React.Fragment>
      <ProductForm mode="edit" data={data} SubmitClick={UpdateProduct} />
      {updateProductApi.isLoading && <div>Updating...</div>}
      {updateProductApi.isError && <div>Error occured while saving...</div>}
      {isSuccess && (
        <div>
          Product updated successfully.
        </div>
      )}
    </React.Fragment>
  );
}

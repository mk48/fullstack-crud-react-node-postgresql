import React, { useState, useEffect } from "react";

//local
import useDataApi from "../Common/DataApi/useDataApi";

//private
import ProductForm from "./ProductForm";

export default function ProductFormEdit({match}) {
  const [isSuccess, setIsSuccess] = useState(false);
  const getProductApi = useDataApi("get", "products", null);
  const updateProductApi = useDataApi("post", "products/update", {});

  useEffect(() => {
    getProductApi.fetchData({ id: match.params.ProductId });
  }, [match.params.ProductId]);

  const UpdateProduct = async data => {
    await updateProductApi.fetchData({ ...data, id: match.params.ProductId });
    setIsSuccess(true);
  };

  const data = getProductApi.data;

  return getProductApi.loading || !data ? (
    <div>loading...</div>
  ) : (
    <React.Fragment>
      <ProductForm mode="edit" data={data} SubmitClick={UpdateProduct} />
      {updateProductApi.loading && <div>Updating...</div>}
      {updateProductApi.isError && <div>Error occured while saving...</div>}
      {isSuccess && (
        <div>
          Product updated successfully.
        </div>
      )}
    </React.Fragment>
  );
}

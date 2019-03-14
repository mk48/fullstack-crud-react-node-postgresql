import React, { useState, useEffect } from "react";

//local
import useDataApi from "../Common/DataApi/useDataApi";

//private
import PurchaseForm from "./PurchaseForm";

export default function PurchaseFormEdit({match}) {
  const [isSuccess, setIsSuccess] = useState(false);
  const getPurchaseApi = useDataApi("get", "purchase", null);
  const updatePurchaseApi = useDataApi("post", "purchase/update", {});

  useEffect(() => {
    getPurchaseApi.fetchData({ id: match.params.PurchaseId });
  }, [match.params.PurchaseId]);

  const UpdatePurchase = async data => {
    await updatePurchaseApi.fetchData({ ...data, id: match.params.PurchaseId });
    setIsSuccess(true);
  };

  const data = getPurchaseApi.data;

  return getPurchaseApi.loading || !data ? (
    <div>loading...</div>
  ) : (
    <React.Fragment>
      <PurchaseForm mode="edit" data={data} SubmitClick={UpdatePurchase} />
      {updatePurchaseApi.loading && <div>Updating...</div>}
      {updatePurchaseApi.isError && <div>Error occured while saving...</div>}
      {isSuccess && (
        <div>
          Purchase updated successfully.
        </div>
      )}
    </React.Fragment>
  );
}

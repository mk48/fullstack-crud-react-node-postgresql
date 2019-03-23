import React, { useState, useEffect } from "react";

//local
import useDataApi from "../Common/DataApi/useDataApi";

//private
import PurchaseForm from "./Form/PurchaseForm";

export default function PurchaseFormEdit({ match }) {
  const [isSuccess, setIsSuccess] = useState(false);
  const getPurchaseApi = useDataApi("get", null);
  const updatePurchaseApi = useDataApi("post", {});

  useEffect(() => {
    getPurchaseApi.doFetch("purchase", { id: match.params.PurchaseId });
  }, [match.params.PurchaseId]);

  const UpdatePurchase = async data => {
    await updatePurchaseApi.doFetch("purchase/update", { ...data, id: match.params.PurchaseId });
    setIsSuccess(true);
  };

  const data = getPurchaseApi.data;

  let UpdateOutput = null;
  if (updatePurchaseApi.isLoading) {
    UpdateOutput = <div>Updating...</div>;
  } else if (updatePurchaseApi.isError) {
    UpdateOutput = <div>Error occured while saving...</div>;
  } else if (isSuccess) {
    UpdateOutput = <div>Purchase updated successfully.</div>;
  }

  return getPurchaseApi.isLoading || !data ? (
    <div>loading...</div>
  ) : (
    <React.Fragment>
      <PurchaseForm mode="edit" data={data} SubmitClick={UpdatePurchase} />
      {UpdateOutput}
    </React.Fragment>
  );
}

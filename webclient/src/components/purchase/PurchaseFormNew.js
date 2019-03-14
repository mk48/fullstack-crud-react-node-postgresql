import React, { useState } from "react";

//local
import useDataApi from "../Common/DataApi/useDataApi";
import { Today } from "./../../util/date";

//private
import PurchaseForm from "./PurchaseForm";

const InitialData = {
  billno: "",
  bill_date: Today(),
  supplier: {
    id: "",
    name: ""
  },
  purchase_grids: [],
  amount: 0,
  discount_percentage: 0,
  discount_amount: 0,
  tot: 0
};

export default function PurchaseFormNew() {
  const [data, setData] = useState(InitialData);
  const [lastUpdate, setLastUpdate] = useState(Today());
  const [isSuccess, setIsSuccess] = useState(false);
  const savePurchaseApi = useDataApi("post", "purchase", {});

  async function SavePurchase(data) {
    setIsSuccess(false);
    await savePurchaseApi.fetchData(data);
    if (!savePurchaseApi.isError) {
      setData({ ...InitialData });
      setIsSuccess(true);
      setLastUpdate(new Date());
    }
  }

  return (
    <React.Fragment>
      <PurchaseForm
        key={lastUpdate}
        mode="new"
        data={data}
        SubmitClick={SavePurchase}
      />
      {savePurchaseApi.loading && <div>Adding...</div>}
      {savePurchaseApi.isError && <div>Error occured while saving...</div>}
      {isSuccess && (
        <div>
          Purchase saved successfully, you can continue adding new Purchases.
        </div>
      )}
    </React.Fragment>
  );
}

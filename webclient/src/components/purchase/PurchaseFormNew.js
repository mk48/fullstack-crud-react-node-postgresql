import React, { useState } from "react";

//local
import useDataApi from "../Common/DataApi/useDataApi";
import { Today } from "./../../util/date";

//private
import PurchaseForm from "./Form/PurchaseForm";

const InitialGridCount = 5;
const purchase_grids = [];
for (let index = 1; index <= InitialGridCount; index++) {
  purchase_grids.push({
    id: "",
    srno: index,
    product: { id: "", name: "" },
    mrp: "",
    qty: "",
    qty_mrp: ""
  });
}

const InitialData = {
  billno: "",
  bill_date: Today(),
  supplier: {
    id: "",
    name: ""
  },
  purchase_grids: purchase_grids,
  amount: 0,
  discount_percentage: 0,
  discount_amount: 0,
  tot: 0
};

export default function PurchaseFormNew() {
  const [data, setData] = useState(InitialData);
  const [lastUpdate, setLastUpdate] = useState(Today());
  const [isSuccess, setIsSuccess] = useState(false);
  const savePurchaseApi = useDataApi("post", {});

  async function SavePurchase(data) {
    setIsSuccess(false);

    try {
      await savePurchaseApi.doFetch("purchase", data);
      setData({ ...InitialData });
      setIsSuccess(true);
      setLastUpdate(new Date());
    } catch (e) {
      //what ever need to be done will be done in the render (below methods)
    }
  }

  let AddedOutput = null;
  if (savePurchaseApi.isLoading) {
    AddedOutput = <div>Adding...</div>;
  } else if (savePurchaseApi.isError) {
    AddedOutput = <div>Error occured while saving...</div>;
  } else if (isSuccess) {
    AddedOutput = (
      <div>
        Purchase saved successfully, you can continue adding new Purchases.
      </div>
    );
  }

  return (
    <React.Fragment>
      <PurchaseForm
        key={lastUpdate}
        mode="new"
        data={data}
        SubmitClick={SavePurchase}
      />
      {AddedOutput}
    </React.Fragment>
  );
}

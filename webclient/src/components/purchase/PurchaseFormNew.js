import React, { useState } from "react";

//local
import useDataApi from "../Common/DataApi/useDataApi";

//private
import PurchaseForm from "./PurchaseForm";

const date = new Date();
const month = Number(date.getMonth()) + 1;
const fullDate =
  date.getFullYear() + "-" + month + "-" + date.getDate();

const InitialData = {
  billno: "",
  bill_date: fullDate,
  supplier: {
      id: "",
      name: ""
  },
  purchase_grid: [],
  amount: 0,
  discount_percentage: 0,
  discount_amount: 0,
  tot: 0
};

export default function PurchaseFormNew() {
  const [data, setData] = useState(InitialData);
  const [lastUpdate, setLastUpdate] = useState(date);
  const [isSuccess, setIsSuccess] = useState(false);
  const savePurchaseApi = useDataApi("post", "purchases", {});

  async function SavePurchase (data) {
    console.log(data);
    return;
    setIsSuccess(false);
    await savePurchaseApi.fetchData(data);
    setData({...InitialData});
    setIsSuccess(true);
    setLastUpdate(new Date());
  };

  return (
    <React.Fragment>
      <PurchaseForm key={lastUpdate} mode="new" data={data} SubmitClick={SavePurchase} />
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

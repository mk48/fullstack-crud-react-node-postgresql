import React, { useEffect } from "react";
import { saveAs } from 'file-saver';

//local
import useDataApi from "../Common/DataApi/useDataApi";

//const
import { SERVER_URL } from "./../../util/constant";

export default function PurchasePrint({ match }) {
    
    //saveAs(`${SERVER_URL}/report/test`, "a.pdf");

  const getPurchaseApi = useDataApi("get", null);

  useEffect(() => {
    getPurchaseApi.doFetch("report/testhtml");
  }, []);

  const data = getPurchaseApi.data;

  return getPurchaseApi.loading || !data ? (
    <div>loading...</div>
  ) : (
    <div>
        <div dangerouslySetInnerHTML={{__html: data.report}} />
    </div>
  );
}

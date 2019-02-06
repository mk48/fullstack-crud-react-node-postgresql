import React, { useEffect, useState } from "react";

//Libs
import axios from "axios";
import AsyncSelect from "react-select/lib/Async";

//const
import { SERVER_URL } from "./../../util/constant";

const options = [
  { value: "cho", label: "Chocolate" },
  { value: "str", label: "Strawberry" },
  { value: "van", label: "Vanilla" }
];

export default function CategorySelection(props) {
  
  async function promiseOptions(inputValue) {
    try {
      const values = await axios.get(`${SERVER_URL}/${props.ApiUrl}`, {
        params: {name: inputValue}
      });
      //console.log(values);
      return values.data;
    } catch (error) {
      console.log(error);
    }
  }

  return <AsyncSelect loadOptions={promiseOptions} value={props.value} onChange={props.onChange} />;
}

import React, { useRef } from "react";

//Libs
import axios from "axios";
import AsyncSelect from "react-select/lib/Async";

//local
import useDebouncedCallback from "./useDebouncedCallback";

//const
import { SERVER_URL, AUTOSUGGEST_DELAY } from "./../../util/constant";

/*const options = [
  { value: "cho", label: "Chocolate" },
  { value: "str", label: "Strawberry" },
  { value: "van", label: "Vanilla" }
];*/

export default function Selection(props) {
  const loadedValues = useRef(null);
  const debouncedLoadValuesFromDB = useDebouncedCallback(
    loadValuesFromDB,
    AUTOSUGGEST_DELAY,
    []
  );

  async function loadValuesFromDB(inputValue) {
    if (inputValue.length >= props.minimumInputLength) {
      try {
        console.log("for drop down : input value = " + inputValue);
        const values = await axios.get(`${SERVER_URL}/${props.ApiUrl}`, {
          params: { name: inputValue }
        });
        //console.log(values);
        loadedValues.current = values.data;
        return values.data;
      } catch (error) {
        console.log(error);
      }
    } else {
      return loadedValues.current;
    }
  }

  return <AsyncSelect loadOptions={debouncedLoadValuesFromDB} {...props} />;
}

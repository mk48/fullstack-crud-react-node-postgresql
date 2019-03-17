import { useReducer } from "react";
import axios from "axios";

//const
import { SERVER_URL } from "./../../../util/constant";

//concept taken from
//https://www.robinwieruch.de/react-hooks-fetch-data/

const dataFetchReducer = (state, action) => {
  switch (action.type) {
    case "FETCH_INIT":
      return {
        ...state,
        isLoading: true,
        isError: false
      };
    case "FETCH_SUCCESS":
      return {
        ...state,
        isLoading: false,
        isError: false,
        data: action.payload
      };
    case "FETCH_FAILURE":
      return {
        ...state,
        isLoading: false,
        isError: true
      };
    default:
      throw new Error();
  }
};

const useDataApi = (apiMethod, url, initialData) => {
  const [state, dispatch] = useReducer(dataFetchReducer, {
    isLoading: false,
    isError: false,
    data: initialData
  });

  const doFetch = async toServer => {
    dispatch({ type: "FETCH_INIT" });

    const fullURL = `${SERVER_URL}/${url}`;

    try {
      let result;
      if (apiMethod === "post") {
        result = await axios.post(fullURL, toServer);
      } else if (apiMethod === "get") {
        result = await axios.get(fullURL, { params: toServer });
      }
      
      dispatch({ type: "FETCH_SUCCESS", payload: result.data });
      
    } catch (error) {      
      dispatch({ type: "FETCH_FAILURE" });
      console.log("error...", state);
    }
  };

  return { ...state, doFetch };
};

export default useDataApi;

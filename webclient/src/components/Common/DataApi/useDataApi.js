import { useState, useReducer, useEffect, useRef } from "react";
import Axios from "./../../../util/Axios";

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

const useDataApi = (apiMethod, initialData) => {
  const [url, setUrl] = useState("");
  const [toServer, setToServer] = useState({});
  const reject = useRef(null);
  const resolve = useRef(null);

  const [state, dispatch] = useReducer(dataFetchReducer, {
    isLoading: false,
    isError: false,
    data: initialData
  });

  useEffect(() => {
    let didCancel = false;

    const fetchData = async () => {
      dispatch({ type: "FETCH_INIT" });

      try {
        const fullURL = `/${url}`;
        let result;
        
        console.log("api request...");

        if (apiMethod === "post") {
          result = await Axios.post(fullURL, toServer);
        } else if (apiMethod === "get") {
          result = await Axios.get(fullURL, { params: toServer });
        }

        if (!didCancel) {
          dispatch({ type: "FETCH_SUCCESS", payload: result.data });
          resolve.current(result.data);
        }
      } catch (error) {
        if (!didCancel) {
          dispatch({ type: "FETCH_FAILURE" });
          reject.current(error);
        }
      }
    };

    if (url !== "") {
      fetchData();
    }

    return () => {
      didCancel = true;
    };
  }, [url, toServer]);

  const doFetch = (url, toserver) => {
    setUrl(url);
    setToServer(toserver);
    
    const promise = new Promise((res, rej) => {
      resolve.current = res;
      reject.current = rej;
    });
    
    return promise;
  };

  return { ...state, doFetch };
};

export default useDataApi;

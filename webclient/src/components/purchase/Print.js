import React, { useEffect, useReducer } from "react";
import axios from "axios";
import { saveAs } from "file-saver";

//const
import { SERVER_URL } from "./../../util/constant";

const LOAD_REPORTS = "LOAD_REPORTS";
const LOAD_INIT = "LOAD_INIT";
const LOAD_SUCCESS = "LOAD_SUCCESS";
const LOAD_ERROR = "LOAD_ERROR";

function reducerMiddleware(dispatch) {
  return async action => {
    console.log(action.type, action.data);

    switch (action.type) {
      case LOAD_REPORTS:
        try {
          const result = await axios.get(`${SERVER_URL}/report/testhtml`);
          dispatch({ type: LOAD_SUCCESS, data: result.data });
        } catch (e) {
          dispatch({ type: LOAD_ERROR });
        }
        break;

      default:
        return dispatch(action);
    }
  };
}

function reducer(state, action) {
  //console.log(action.type);

  switch (action.type) {
    case LOAD_INIT:
      return {
        ...state,
        isLoading: true,
        message: false
      };
    case LOAD_SUCCESS:
      return {
        ...state,
        data: action.data,
        isLoading: false,
        isError: false
      };
    case LOAD_ERROR:
      return {
        ...state,
        isLoading: false,
        isError: true
      };

    default:
      return state;
  }
}

const initialState = {
  data: {},

  isLoading: false, //loading data from DB
  isProcessing: false, //sending data to DB
  isError: false,
  message: false
};

export default function Print({ match }) {
  const [state, dispatchBase] = useReducer(reducer, initialState);
  const dispatch = reducerMiddleware(dispatchBase);

  //saveAs(`${SERVER_URL}/report/test`, "a.pdf");

  useEffect(() => {
    dispatch({ type: LOAD_INIT });
    dispatch({ type: LOAD_REPORTS });
  }, []);

  return (
    <div>
      {state.isLoading && <div>Loading...</div>}
      {state.isError && <div>Error occured while saving...</div>}
      <div dangerouslySetInnerHTML={{ __html: state.data.report }} />
    </div>
  );
}

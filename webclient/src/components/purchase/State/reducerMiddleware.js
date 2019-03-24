import axios from "axios";

import {
  SAVE,
  SAVE_ERROR,
  SAVE_SUCCESS,
  LOAD,
  LOAD_ERROR,
  LOAD_SUCCESS,
  UPDATE,
  UPDATE_ERROR,
  UPDATE_SUCCESS
} from "./actionTypes";

//const
import { SERVER_URL } from "./../../../util/constant";

export default function reducerMiddleware(dispatch) {
  return async action => {
    console.log(action.type, action.data);

    switch (action.type) {
      case SAVE:
        try {
          await axios.post(`${SERVER_URL}/purchase`, action.data);
          dispatch({ type: SAVE_SUCCESS });
        } catch (e) {
          dispatch({ type: SAVE_ERROR });
        }
        break;

      case LOAD:
        try {
          const result = await axios.get(`${SERVER_URL}/purchase`, {
            params: { id: action.data }
          });
          dispatch({ type: LOAD_SUCCESS, data: result.data });
        } catch (e) {
          dispatch({ type: LOAD_ERROR });
        }
        break;

      case UPDATE:
        try {
          await axios.post(`${SERVER_URL}/purchase/update`, action.data);
          dispatch({ type: UPDATE_SUCCESS });
        } catch (e) {
          dispatch({ type: UPDATE_ERROR });
        }
        break;

      default:
        return dispatch(action);
    }
  };
}

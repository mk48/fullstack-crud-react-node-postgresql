import axios from "axios";

import { SAVE, SAVE_ERROR, SAVE_SUCCESS } from "./actionTypes";

//const
import { SERVER_URL } from "./../../../util/constant";

export default function reducerMiddleware(dispatch) {
  return async action => {
    console.log(action.type, action.data);

    switch (action.type) {
      case SAVE:
        try {
          await axios.post(`${SERVER_URL}/products`, action.data);
          dispatch({ type: SAVE_SUCCESS });
        } catch (e) {
          dispatch({ type: SAVE_ERROR });
        }
        break;

      default:
        return dispatch(action);
    }
  };
}

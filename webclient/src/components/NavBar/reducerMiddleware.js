import Axios from "./../../util/Axios";

import {
  LOGOUT,
  LOGOUT_SUCCESS,
  LOGOUT_ERROR,
  LOAD_USER_DETAILS,
  LOAD_USER_DETAILS_SUCCESS,
  LOAD_USER_DETAILS_ERROR
} from "./actionTypes";

//const
import {  KEY_USERNAME } from "./../../util/constant";

export default function reducerMiddleware(dispatch) {
  return async action => {
    console.log(action.type, action.data);

    switch (action.type) {
      case LOGOUT:
        try {
          const result = await Axios.get("/user/logout");
          dispatch({ type: LOGOUT_SUCCESS, data: result.data });
        } catch (e) {
          dispatch({ type: LOGOUT_ERROR });
        }
        break;

      case LOAD_USER_DETAILS:
        try {
          const userName = localStorage.getItem(KEY_USERNAME);
          dispatch({ type: LOAD_USER_DETAILS_SUCCESS, data: userName });
        } catch (e) {
          dispatch({ type: LOAD_USER_DETAILS_ERROR });
        }
        break;

      default:
        return dispatch(action);
    }
  };
}

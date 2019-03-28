import {
  LOGOUT_ERROR,
  LOGOUT_INIT,
  LOGOUT_SUCCESS,
  LOAD_USER_DETAILS_SUCCESS
} from "./actionTypes";

import { ClearToken } from "./../../util/Axios";

export default function reducer(state, action) {
  //console.log(action.type);

  switch (action.type) {
    //=============================== logout ===============================
    case LOGOUT_INIT:
      return {
        ...state,
        isLogOutProcessing: true,
        isLogOutError: false,
        message: false
      };

    case LOGOUT_SUCCESS:
      ClearToken();
      return {
        ...state,
        ...action.data,
        isLogOutSuccess: true,
        isLogOutProcessing: false,
        isLogOutError: false
      };

    case LOGOUT_ERROR:
      return {
        ...state,
        isLogOutProcessing: false,
        isLogOutError: true
      };

    //=============================== user details ===============================
    case LOAD_USER_DETAILS_SUCCESS:
      return {
        ...state,
        userName: action.data
      };

    default:
      return state;
  }
}

import {
  LOAD_INIT,
  LOAD_ERROR,
  LOAD_SUCCESS,
  SAVE_INIT,
  SAVE_SUCCESS,
  SAVE_ERROR,
  UPDATE_INIT,
  UPDATE_ERROR,
  UPDATE_SUCCESS,
  NAME_CHANGE,
  CATEGORY_CHANGE,
  EXPIRY_CHANGE,
  IS_EXPIRY_CHANGE,
  PRICE_CHANGE,
  SIZE_CHANGE,
  DESCRIPTION_CHANGE
} from "./actionTypes";

import { initialFormState } from "./initialState";

export default function reducer(state, action) {
  //console.log(action.type);

  switch (action.type) {
    //=============================== Input Fields ===============================
    case NAME_CHANGE:
      return {
        ...state,
        name: action.data
      };

    case CATEGORY_CHANGE:
      return {
        ...state,
        category: { ...state.category, ...action.data }
      };

    case EXPIRY_CHANGE:
      return {
        ...state,
        expiry_date: action.data
      };

    case IS_EXPIRY_CHANGE:
      return {
        ...state,
        is_expiry: action.data
      };

    case PRICE_CHANGE:
      return {
        ...state,
        price: action.data
      };

    case SIZE_CHANGE:
      return {
        ...state,
        size: action.data
      };

    case DESCRIPTION_CHANGE:
      return {
        ...state,
        description: action.data
      };

    //=============================== SAVE ===============================
    case SAVE_INIT:
      return {
        ...state,
        isProcessing: true,
        isError: false,
        message: false
      };
    case SAVE_SUCCESS:
      return {
        ...state,
        ...initialFormState, //put initial form state to clear form
        isProcessing: false,
        isError: false,
        message: "Save successfully"
      };
    case SAVE_ERROR:
      return {
        ...state,
        isProcessing: false,
        isError: true
      };

    //=============================== UPDATE ===============================
    case UPDATE_INIT:
      return {
        ...state,
        isProcessing: true,
        isError: false,
        message: false
      };
    case UPDATE_SUCCESS:
      return {
        ...state,
        isProcessing: false,
        isError: false,
        message: "Updated successfully"
      };
    case UPDATE_ERROR:
      return {
        ...state,
        isProcessing: false,
        isError: true
      };

    //=============================== LOAD ===============================
    case LOAD_INIT:
      return {
        ...state,
        isLoading: true,
        message: false
      };
    case LOAD_SUCCESS:
      return {
        ...state,
        ...action.data,
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

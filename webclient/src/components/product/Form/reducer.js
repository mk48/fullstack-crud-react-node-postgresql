import {
  SAVE_INIT,
  SAVE_SUCCESS,
  SAVE_ERROR,
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
    default:
      return state;
  }
}

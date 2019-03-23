import { Today } from "./../../../util/date";

export const initialFormState = {
  name: "",
  price: 0,
  size: 1,
  is_expiry: false,
  expiry_date: Today(),
  description: "",
  category: { id: "", name: "" }
};

export const initialState = {
  ...initialFormState,

  isLoading: false,   //loading data from DB
  isProcessing: false, //sending data to DB
  isError: false,
  message: false
};

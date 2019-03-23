import { Today } from "./../../../util/date";

const InitialGridCount = 5;
const gridsData = [];
for (let index = 1; index <= InitialGridCount; index++) {
  gridsData.push({
    id: "",
    srno: index,
    product: { id: "", name: "" },
    mrp: "",
    qty: "",
    qty_mrp: ""
  });
}

export const initialFormState = { 
  billno: "",
  bill_date: Today(),
  supplier: {
    id: "",
    name: ""
  },
  purchase_grids: gridsData,
  amount: 0,
  discount_percentage: 0,
  discount_amount: 0,
  tot: 0
};

export const initialState = {
  ...initialFormState,

  isLoading: false,   //loading data from DB
  isProcessing: false, //sending data to DB
  isError: false,
  message: false
};

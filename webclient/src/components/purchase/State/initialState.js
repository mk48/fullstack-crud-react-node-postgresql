import { Today } from "./../../../util/date";

export const defaultValuesForGridItem = {
  id: "",
  srno: 0,
  product: { id: "", name: "" },
  mrp: "",
  qty: "",
  qty_mrp: ""
};

const InitialGridCount = 5;
const gridsData = [];
for (let index = 1; index <= InitialGridCount; index++) {
  gridsData.push({ ...defaultValuesForGridItem, srno: index });
}

export const initialFormState = {
  billno: "",
  bill_date: Today(),
  supplier: {
    id: "",
    name: ""
  },
  purchase_grids: gridsData,
  gridSelectedRowCol: { start: { i: 0, j: 1 }, end: { i: 0, j: 1 } },
  amount: 0,
  discount_percentage: 0,
  discount_amount: 0,
  tot: 0
};

export const initialState = {
  ...initialFormState,

  isLoading: false, //loading data from DB
  isProcessing: false, //sending data to DB
  isError: false,
  message: false
};

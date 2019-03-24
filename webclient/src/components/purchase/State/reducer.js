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
  BILL_NO_CHANGE,
  BILL_DATE_CHANGE,
  SUPPLIER_CHANGE,
  DISCOUNT_PERCENTAGE_CHANGE,
  GRID_PRODUCT_CHANGE,
  GRID_MRP_CHANGE,
  GRID_QTY_CHANGE
} from "./actionTypes";

import { initialFormState } from "./initialState";

export default function reducer(state, action) {
  //console.log(action.type);

  switch (action.type) {
    //=============================== Input Fields ===============================
    case BILL_NO_CHANGE:
      return {
        ...state,
        billno: action.data
      };

    case BILL_DATE_CHANGE:
      return {
        ...state,
        bill_date: action.data
      };

    case SUPPLIER_CHANGE:
      return {
        ...state,
        supplier: { ...state.supplier, ...action.data }
      };

    case DISCOUNT_PERCENTAGE_CHANGE:
      const disPercentage = Number(action.data);
      const disAmount = state.amount * (disPercentage / 100);
      const tot = state.amount - disAmount;
      return {
        ...state,
        discount_percentage: disPercentage,
        discount_amount: disAmount.toFixed(2),
        tot: tot.toFixed(2)
      };

    //=============================== Grid input Fields ===============================
    case GRID_PRODUCT_CHANGE:
      let purchaseGridUpdated = state.purchase_grids.map((pg, i) => {
        if (pg.srno === action.data.srno) {
          return {
            ...pg,
            product: { name: action.data.name, id: action.data.id },
            mrp: action.data.price,
            qty: 1, //1 qty after select drop-down
            qty_mrp: action.data.price //since qty is 1 so price will be same as qty(1) x mrp
          };
        } else {
          return pg;
        }
      });
      const st = { ...state, purchase_grids: purchaseGridUpdated };
      return recalculateTotalAmount(st);

    case GRID_QTY_CHANGE: {
      const qty = Number(action.data.value);
      let purchaseGridUpdated = state.purchase_grids.map((pg, i) => {
        if (pg.srno === action.data.row + 1) {
          return {
            ...pg,
            qty: qty,
            qty_mrp: qty * pg.mrp
          };
        } else {
          return pg;
        }
      });
      const st = { ...state, purchase_grids: purchaseGridUpdated };
      return recalculateTotalAmount(st);
    }

    case GRID_MRP_CHANGE: {
      const mrp = Number(action.data.value);
      let purchaseGridUpdated = state.purchase_grids.map((pg, i) => {
        if (pg.srno === action.data.row + 1) {
          return {
            ...pg,
            mrp: mrp,
            qty_mrp: pg.qty * mrp
          };
        } else {
          return pg;
        }
      });
      const st = { ...state, purchase_grids: purchaseGridUpdated };
      return recalculateTotalAmount(st);
    }

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

//-------------------------------- Private functions -----------------------------

//re-calculate totalAmount
function recalculateTotalAmount(state) {
  const amount = state.purchase_grids.reduce(
    (a, c) => a + Number(c.qty_mrp),
    0
  );
  const disPercentage = Number(state.discount_percentage);
  const disAmount = amount * (disPercentage / 100);
  const tot = amount - disAmount;

  return {
    ...state,
    amount: amount.toFixed(2),
    discount_amount: disAmount.toFixed(2),
    tot: tot.toFixed(2)
  };
}

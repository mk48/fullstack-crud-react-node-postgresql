import { SAVE, LOAD, UPDATE } from "./actionTypes";

export function save(state) {
  const data = collectDatafromState(state);

  return { type: SAVE, data: data };
}

export function load(id) {
  return { type: LOAD, data: id };
}

export function update(id, state) {
  const data = collectDatafromState(state);

  return { type: UPDATE, data: { ...data, id: id } };
}

//============================================= local functions =======================

function collectDatafromState(state) {
  
  //remove empty grid items
  const pgItems = state.purchase_grids.filter(pg => pg.product.id !== "")

  const data = {
    billno: state.billno,
    bill_date: state.bill_date,
    supplier_id: state.supplier.id,
    purchase_grid: pgItems,
    amount: state.amount,
    discount_percentage: state.discount_percentage,
    discount_amount: state.discount_amount,
    tot: state.tot
  };

  return data;
}

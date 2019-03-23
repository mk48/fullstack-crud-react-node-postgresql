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
  const data = {
    name: state.name,
    category_id: state.category.id,
    expiry_date: state.expiry_date,
    is_expiry: state.is_expiry,
    price: state.price,
    size: state.size,
    description: state.description
  };

  return data;
}

import { SAVE } from "./actionTypes";

export function save(state) {
  const data = {
    name: state.name,
    category: state.category.id,
    expiryDate: state.expiry_date,
    isExpiry: state.is_expiry,
    price: state.price,
    size: state.size,
    description: state.description
  };

  return {type: SAVE, data: data};
}

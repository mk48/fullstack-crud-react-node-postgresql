import React from "react";

//local
import Selection from "./../Common/Selection";
import { AmountFormatter } from "./GridComponents";

import { GRID_PRODUCT_CHANGE } from "./State/actionTypes";

import { Menu, Option } from "./ProductSelectionDropDownComponents";

export function GenerateDataSheetGridFromState(state, dispatch) {
  const gridValues = state.purchase_grids.map((pg, i) => {
    const oneRow = [];
    //srno
    oneRow.push({ name: "srno", readOnly: true, value: pg.srno });

    //don't confuse DataSheet's {value, component} with Select control's {label, value}
    //product selection
    oneRow.push({
      name: "product_name",
      value: pg.product.name,
      component: GenerateProductDropDownForGrid(dispatch, {
        srno: pg.srno,
        value: pg.product.id,
        label: pg.product.name
      })
    });

    //qty
    oneRow.push({ name: "qty", value: pg.qty });

    //mrp
    oneRow.push({
      name: "mrp",
      value: pg.mrp,
      valueViewer: AmountFormatter
    });

    //qty x mrp
    oneRow.push({ name: "qty_mrp", readOnly: true, value: pg.qty_mrp });

    return oneRow;
  });

  return gridValues;
}

//============================================== Private functions ========================================

//drop down on Grid
function GenerateProductDropDownForGrid(dispatch, { srno, value, label }) {
  return (
    <Selection
      autoFocus={true}
      ApiUrl="products/search"
      minimumInputLength={2}
      value={{ value, label }}
      onChange={opt => {
        dispatch({ type: GRID_PRODUCT_CHANGE, data: { srno, ...opt } });
        /*UpdatePurchaseGridValues(
            srno,
            {
              product: { name: opt.name, id: opt.id },
              mrp: opt.price,
              qty: 1 //1 qty after select drop-down
            },
            true
          );*/
      }}
      components={{ Menu, Option }}
    />
  );
}

//update purchase grid after selecting product or updating cell values
/*function UpdatePurchaseGridValues(srno, newValues, needRecalculation) {
        let purchaseGridUpdated = purchaseGrid.map((pg, i) => {
          if (pg.srno === srno) {
            return { ...pg, ...newValues };
          } else {
            return pg;
          }
        });
    
        if (needRecalculation) {
          purchaseGridUpdated = RecalculateRow(purchaseGridUpdated, srno);
          recalculateTotalAmount(purchaseGridUpdated);
        }
    
        setPurchaseGrid(purchaseGridUpdated);
      }*/

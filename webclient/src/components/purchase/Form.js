import React, { useReducer, useRef, useEffect } from "react";
import ReactDataSheet from "react-datasheet";
import "react-datasheet/lib/react-datasheet.css";

//Local
import Selection from "../Common/Selection";
import { GenerateDataSheetGridFromState } from "./FormUtil";
import { PurchaseGridOneCell } from "./GridComponents";

//style component
import { Row, Column } from "../style/grid";
import { Button, TextBox } from "../style/form";

//private
import "./style.css";

//State management components
import reducerMiddleware from "./State/reducerMiddleware";
import reducer from "./State/reducer";
import { initialState } from "./State/initialState";
import {
  BILL_NO_CHANGE,
  BILL_DATE_CHANGE,
  SUPPLIER_CHANGE,
  DISCOUNT_PERCENTAGE_CHANGE,
  SAVE_INIT,
  LOAD_INIT,
  UPDATE_INIT,
  ADD_ONE_PURCHASE_GRID_ROW,
  GRID_MRP_CHANGE,
  GRID_QTY_CHANGE
} from "./State/actionTypes";
import { save, load, update } from "./State/actionCreator";

export default function Form({ match }) {
  const [state, dispatchBase] = useReducer(reducer, initialState);
  const dispatch = reducerMiddleware(dispatchBase);

  //------------- element ref
  const inputElementBillNo = useRef(null);
  const inputElementDate = useRef(null);
  const inputElementSupplier = useRef(null);
  const inputElementDiscountPercentage = useRef(null);
  const inputElementSubmit = useRef(null);

  //add all elements into array, so that will move next
  let currentFocusElementIndex = useRef(0);
  const AllInputElements = [
    inputElementBillNo,
    inputElementDate,
    inputElementSupplier,
    inputElementDiscountPercentage,
    inputElementSubmit
  ];

  useEffect(() => {
    if (match.params.id) {
      //if id available means it's for edit mode
      //load the bill for edit
      dispatch({ type: LOAD_INIT });
      dispatch(load(match.params.id));
    }

    inputElementBillNo.current.focus();
  }, []);

  async function handleSubmit(e) {
    e.preventDefault();

    if (match.params.id) {
      //edit mode
      dispatch({ type: UPDATE_INIT });
      dispatch(update(match.params.id, state));
    } else {
      //new mode
      dispatch({ type: SAVE_INIT });
      dispatch(save(state));
    }
  }

  function KeyDownEvent(e) {
    if (e.keyCode === 13) {
      e.preventDefault();
      currentFocusElementIndex.current++;
      if (AllInputElements[currentFocusElementIndex.current]) {
        AllInputElements[currentFocusElementIndex.current].current.focus();
      } else {
        currentFocusElementIndex.current = 0;
      }
    }
  }

  function gridCellsChanged(changes) {
    changes.forEach(({ cell, row, col, value }) => {
      switch (cell.name) {
        case "qty":
          dispatch({
            type: GRID_QTY_CHANGE,
            data: { cell, row, col, value }
          });
          break;

        case "mrp":
          dispatch({
            type: GRID_MRP_CHANGE,
            data: { cell, row, col, value }
          });
          break;

        default:
          break;
      }
    });
  }

  return (
    <form onSubmit={handleSubmit}>
      <Row>
        <Column span="4">
          <label htmlFor="name">Bill No</label>
          <br />
          <TextBox
            type="text"
            id="billNo"
            name="billNo"
            ref={inputElementBillNo}
            onKeyDown={KeyDownEvent}
            value={state.billno}
            onChange={e =>
              dispatch({ type: BILL_NO_CHANGE, data: e.target.value })
            }
            required
          />
        </Column>

        <Column span="4">
          <label htmlFor="name">Date</label>
          <br />
          <TextBox
            type="date"
            id="date"
            name="date"
            ref={inputElementDate}
            onKeyDown={KeyDownEvent}
            value={state.bill_date}
            onChange={e =>
              dispatch({ type: BILL_DATE_CHANGE, data: e.target.value })
            }
            required
          />
        </Column>

        <Column span="4">
          supplier <br />
          <Selection
            ApiUrl="supplier/search"
            id="supplier"
            name="supplier"
            minimumInputLength={2}
            Ref={inputElementSupplier}
            onInputKeyDown={KeyDownEvent}
            value={{ value: state.supplier.id, label: state.supplier.name }}
            onChange={e =>
              dispatch({
                type: SUPPLIER_CHANGE,
                data: { id: e.value, name: e.label }
              })
            }
          />
        </Column>
      </Row>
      <ReactDataSheet
        data={GenerateDataSheetGridFromState(state, dispatch)}
        valueRenderer={cell => cell.value}
        sheetRenderer={props => (
          <table className={props.className + " purchaseGrid"}>
            <thead>
              <tr>
                <th className="header" width="50px">
                  SrNo
                </th>
                <th className="header">Product</th>
                <th className="header" width="100px">
                  Qty
                </th>
                <th className="header" width="100px">
                  Mrp
                </th>
                <th className="header" width="100px">
                  Qty x Mrp
                </th>
              </tr>
            </thead>
            <tbody>{props.children}</tbody>
          </table>
        )}
        rowRenderer={({ row, cells, children }) => <tr>{children}</tr>}
        onCellsChanged={gridCellsChanged}
        cellRenderer={PurchaseGridOneCell}
        /*selected={{
          start: { i: selectedRowCol.start.i, j: selectedRowCol.start.j },
          end: { i: selectedRowCol.end.i, j: selectedRowCol.end.j }
        }}*/
        //selected={selectedRowCol}
        //onSelect={selected => setSelectedRowCol(selected)}
      />

      <Button onClick={e => dispatch({ type: ADD_ONE_PURCHASE_GRID_ROW })}>
        Add rows
      </Button>

      <Row>
        <Column span="3">
          <label htmlFor="amount">Amount</label>
          <br />
          {state.amount}
        </Column>

        <Column span="3">
          <label htmlFor="discountPercentage">Discount %</label>
          <br />
          <TextBox
            type="number"
            id="discountPercentage"
            name="discountPercentage"
            step="0.01"
            min="0"
            max="9999999"
            ref={inputElementDiscountPercentage}
            onKeyDown={KeyDownEvent}
            value={state.discount_percentage}
            onChange={e =>
              dispatch({
                type: DISCOUNT_PERCENTAGE_CHANGE,
                data: e.target.value
              })
            }
          />
        </Column>

        <Column span="3">
          <label htmlFor="discountAmount">Discount amount</label>
          <br />
          {state.discount_amount}
        </Column>

        <Column span="3">
          <label htmlFor="total">Total</label>
          <br />
          {state.tot}
        </Column>
      </Row>

      <Row>
        <Button primary type="submit" ref={inputElementSubmit}>
          {match.params.id ? "Edit" : "Save"}
        </Button>
      </Row>

      <Row>
        <Column span="12">
          {state.isLoading && <div>Loading...</div>}
          {state.isProcessing && <div>Adding...</div>}
          {state.isError && <div>Error occured while saving...</div>}
          {state.message && <div>{state.message}</div>}
        </Column>
      </Row>
    </form>
  );
}

import React, { useEffect, useReducer } from "react";

//style component
import { Row, Column } from "../style/grid";

//State management components
import reducerMiddleware from "./State/reducerMiddleware";
import reducer from "./State/reducer";
import { initialState } from "./State/initialState";
import { LOAD_INIT } from "./State/actionTypes";
import { load } from "./State/actionCreator";

export default function ProductView({ match }) {
  const [state, dispatchBase] = useReducer(reducer, initialState);
  const dispatch = reducerMiddleware(dispatchBase);

  useEffect(() => {
    dispatch({ type: LOAD_INIT });
    dispatch(load(match.params.id));
  }, [match.params.id]);

  return (
    <React.Fragment>
      {state.isLoading && <div>Loading...</div>}
      <Row>
        <Column span="3">Name</Column>
        <Column span="9">{state.name}</Column>
      </Row>
      <Row>
        <Column span="3">Category</Column>
        <Column span="9">{state.category.name}</Column>
      </Row>
      <Row>
        <Column span="3">Price</Column>
        <Column span="9">{state.price}</Column>
      </Row>
      <Row>
        <Column span="3">Size</Column>
        <Column span="9">{state.size}</Column>
      </Row>
      <Row>
        <Column span="3">Is Expiry</Column>
        <Column span="9">{state.is_expiry && "✓"}</Column>
      </Row>
      <Row>
        <Column span="3">Expiry date</Column>
        <Column span="9">{state.expiry_date}</Column>
      </Row>
      <Row>
        <Column span="3">Description</Column>
        <Column span="9">{state.description}</Column>
      </Row>
    </React.Fragment>
  );
}

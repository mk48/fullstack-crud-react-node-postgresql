import React, { useEffect, useReducer } from "react";

import { Link, Redirect } from "react-router-dom";

//style component
import { Row, Column } from "../style/grid";

import Tab from "./../Common/Tab";

//style
import { NavBarStyle, ToolbarButton, Logout } from "./style";

//state
import { initialState } from "./initialState";
import reducerMiddleware from "./reducerMiddleware";
import reducer from "./reducer";
import { LOAD_USER_DETAILS, LOGOUT_INIT, LOGOUT } from "./actionTypes";

export default function NavBar({ match }) {
  const [state, dispatchBase] = useReducer(reducer, initialState);
  const dispatch = reducerMiddleware(dispatchBase);

  useEffect(() => {
    //load user name from local storage
    dispatch({ type: LOAD_USER_DETAILS });
  }, []);

  function logout() {
    dispatch({ type: LOGOUT_INIT });
    dispatch({ type: LOGOUT });
  }

  if (state.isLogOutSuccess) {
    return <Redirect to="/login" />;
  }

  return (
    <Row>
      <Column span="11">
        <NavBarStyle>
          <Tab>
            <div tabId={1} label="Product">
              <Link to={"/product/list"}>
                <ToolbarButton>List all</ToolbarButton>
              </Link>
              <Link to={"/product/new"}>
                <ToolbarButton>Add new</ToolbarButton>
              </Link>
            </div>
            <div tabId={2} label="Purchase">
              <Link to={"/purchase/list"}>
                <ToolbarButton>List all</ToolbarButton>
              </Link>
              <Link to={"/purchase/new"}>
                <ToolbarButton>Add new</ToolbarButton>
              </Link>
            </div>
          </Tab>
        </NavBarStyle>
      </Column>

      <Column span="1">
          {state.userName} | <Logout onClick={logout}>logout</Logout>
      </Column>
    </Row>
  );
}

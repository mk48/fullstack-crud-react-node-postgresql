import React from "react";

import {
  BrowserRouter as Router,
  Route,
  Link,
  NavLink
} from "react-router-dom";

//style component
import { Row, Column } from "../style/grid";

import Tab from "./../Common/Tab";
import { KEY_USERNAME } from "../../util/constant";

export default function NavBar({ match }) {
  const userName = localStorage.getItem(KEY_USERNAME);

  return (
    <Row>
      <Column span="11">
        <Tab>
          <div tabId={1} label="Product">
            <Link to={"/product/list"}>List all</Link> &nbsp;
            <Link to={"/product/new"}>Add new</Link>
          </div>
          <div tabId={2} label="Purchase">
            <Link to={"/purchase/list"}>List all</Link> &nbsp;
            <Link to={"/purchase/new"}>Add new</Link>
          </div>
        </Tab>
      </Column>
      <Column span="1">{userName} - logout</Column>
    </Row>
  );
}

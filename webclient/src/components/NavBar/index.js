import React from "react";

import {
  BrowserRouter as Router,
  Route,
  Link,
  NavLink
} from "react-router-dom";

import Tab from "./../Common/Tab";

export default function NavBar({ match }) {
  return (
    <div>
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
    </div>
  );
}

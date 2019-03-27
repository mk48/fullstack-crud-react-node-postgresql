import React from "react";

import { Link } from "react-router-dom";

import Tab from "./../Common/Tab";

//style
import { NavBarStyle, ToolbarButton } from "./style";

export default function NavBar({ match }) {
  return (
    <NavBarStyle>
      <Tab>
        <div tabId={1} label="Product">
          <Link to={"/product/list"}>
            <ToolbarButton>List all</ToolbarButton>
          </Link>
          &nbsp;
          <Link to={"/product/new"}>
            <ToolbarButton>Add new</ToolbarButton>
          </Link>
        </div>
        <div tabId={2} label="Purchase">
          <Link to={"/purchase/list"}>
            <ToolbarButton>List all</ToolbarButton>
          </Link>{" "}
          &nbsp;
          <Link to={"/purchase/new"}>
            <ToolbarButton>Add new</ToolbarButton>
          </Link>
        </div>
      </Tab>
    </NavBarStyle>
  );
}

import React from "react";

import { Link } from "react-router-dom";

//style component
import { Row, Column } from "../style/grid";

import Tab from "./../Common/Tab";
import { KEY_USERNAME } from "../../util/constant";

//style
import { NavBarStyle, ToolbarButton } from "./style";

export default function NavBar({ match }) {
  const userName = localStorage.getItem(KEY_USERNAME);

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

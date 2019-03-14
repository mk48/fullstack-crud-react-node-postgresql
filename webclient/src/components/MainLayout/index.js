import React from "react";

import { BrowserRouter as Router, Route, Link, NavLink } from "react-router-dom";

import Home from "./../Home";
import Product from "./../product";
import Purchase from "./../purchase";

export default function MainLayout() {
  return (
    <Router>
      <div>
        <Link to="/">Home</Link> &nbsp;
        <NavLink to="/product">Product</NavLink>  &nbsp;
        <NavLink to="/purchase">Purchase</NavLink>

        <hr />

        <Route exact path="/" component={Home} />
        <Route path="/product" component={Product} />
        <Route path="/purchase" component={Purchase} />
      </div>
    </Router>
  );
}

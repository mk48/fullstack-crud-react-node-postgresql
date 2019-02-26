import React from "react";

import { BrowserRouter as Router, Route, Link } from "react-router-dom";

import Home from "./../Home";
import Product from "./../product";
import Purchase from "./../purchase";

export default function MainLayout() {
  return (
    <Router>
      <div>
        <Link to="/">Home</Link> &nbsp;
        <Link to="/product">Product</Link>  &nbsp;
        <Link to="/purchase">Purchase</Link>

        <hr />

        <Route exact path="/" component={Home} />
        <Route path="/product" component={Product} />
        <Route path="/purchase" component={Purchase} />
      </div>
    </Router>
  );
}

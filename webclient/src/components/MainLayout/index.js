import React from "react";

import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import Home from "./../Home";
import Product from "./../product";
import Purchase from "./../purchase";
import Login from "./../Login";

//private
import PrivateRoute from "./PrivateRoute";

export default function MainLayout() {
  return (
    <Router>
      <Switch>
        <Route exact path="/" component={Login} />
        <Route path="/login" component={Login} />
        <PrivateRoute path="/home" component={Home} />
        <PrivateRoute path="/product" component={Product} />
        <PrivateRoute path="/purchase" component={Purchase} />
      </Switch>
    </Router>
  );
}

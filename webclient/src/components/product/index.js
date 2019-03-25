import React from "react";
import { Route, Link } from "react-router-dom";

//Private
import View from "./View";
import List from "./List";
import Form from "./Form";

export default function ({ match }) {
  return (
    <div>
      {/*<b>Product</b> &nbsp;
      <Link to={`${match.url}/list`}>List all</Link> &nbsp;
      <Link to={`${match.url}/new`}>Add new</Link>
      <hr />*/}
      <Route path={`${match.url}/list`} component={List} />
      <Route path={`${match.url}/view/:id`} component={View} />
      <Route path={`${match.url}/new`} component={Form} />      
      <Route path={`${match.url}/edit/:id`} component={Form} />
      <Route
        exact
        path={match.url}
        render={() => <h3>Please select an option</h3>}
      />
    </div>
  );
}

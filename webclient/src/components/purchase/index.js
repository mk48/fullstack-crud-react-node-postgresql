import React from "react";
import { Route } from "react-router-dom";

//Private
import View from "./View";
import List from "./List";
import Form from "./Form";
import Print from "./Print";

export default function({ match }) {
  console.log("Purchase/index");
  return (
    <div>
      <Route path={`${match.url}/list`} component={List} />
      <Route path={`${match.url}/view/:id`} component={View} />
      <Route path={`${match.url}/new`} component={Form} />
      <Route path={`${match.url}/edit/:id`} component={Form} />
      <Route path={`${match.url}/print/:id`} component={Print} />
      <Route
        exact
        path={match.url}
        render={() => <h3>Please select an option</h3>}
      />
    </div>
  );
}

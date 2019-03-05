import React from "react";
import { Route, Link } from "react-router-dom";

//Private
import PurchaseView from "./PurchaseView";
import PurchaseList from "./PurchaseList";
import PurchaseFormEdit from "./PurchaseFormEdit";
import PurchaseFormNew from "./PurchaseFormNew";

export default function Purchase({ match }) {
  return (
    <div>
      <b>Purchase</b> &nbsp;
      <Link to={`${match.url}/list`}>List all</Link> &nbsp;
      <Link to={`${match.url}/new`}>Add new</Link>
      <hr />
      <Route path={`${match.url}/list`} component={PurchaseList} />
      <Route path={`${match.url}/new`} component={PurchaseFormNew} />
      <Route path={`${match.url}/view/:PurchaseId`} component={PurchaseView} />
      <Route
        path={`${match.url}/edit/:PurchaseId`}
        component={PurchaseFormEdit}
      />
      <Route
        exact
        path={match.url}
        render={() => <h3>Please select an option</h3>}
      />
    </div>
  );
}

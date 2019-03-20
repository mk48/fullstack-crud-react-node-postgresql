import React from "react";
import { Route, Link } from "react-router-dom";

//Private
import ProductView from "./ProductView";
import ProductList from "./ProductList";
import ProductFormEdit from "./ProductFormEdit";
//import ProductFormNew from "./ProductFormNew";
import ProductForm from "./Form/ProductForm";

export default function Product({ match }) {
  return (
    <div>
      <b>Product</b> &nbsp;
      <Link to={`${match.url}/list`}>List all</Link> &nbsp;
      <Link to={`${match.url}/new`}>Add new</Link>
      <hr />
      <Route path={`${match.url}/list`} component={ProductList} />
      <Route path={`${match.url}/new`} component={ProductForm} />
      <Route path={`${match.url}/view/:ProductId`} component={ProductView} />
      <Route
        path={`${match.url}/edit/:ProductId`}
        component={ProductFormEdit}
      />
      <Route
        exact
        path={match.url}
        render={() => <h3>Please select an option</h3>}
      />
    </div>
  );
}

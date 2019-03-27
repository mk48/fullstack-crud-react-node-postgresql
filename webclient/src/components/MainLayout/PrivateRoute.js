import React from "react";

import { Route, Redirect } from "react-router-dom";
import NavBar from "./../NavBar";

import { KEY_ISLOGGEDIN } from "./../../util/constant";

export default function PrivateRoute({ component: Component, ...rest }) {
  const isLoggedIn = localStorage.getItem(KEY_ISLOGGEDIN);

  return (
    <Route
      {...rest}
      render={props =>
        isLoggedIn ? (
          <>
            <NavBar />
            <Component {...props} />
          </>
        ) : (
          <Redirect
            to={{
              pathname: "/login",
              state: { from: props.location }
            }}
          />
        )
      }
    />
  );
}

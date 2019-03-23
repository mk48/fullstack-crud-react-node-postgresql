import React from "react";
import { components } from "react-select";

//bottom part of selection drop-down
export function Menu(props) {
  return <components.Menu {...props}>{props.children}</components.Menu>;
}

export function Option(props) {
  return <components.Option {...props}>{props.data.name}</components.Option>;
}

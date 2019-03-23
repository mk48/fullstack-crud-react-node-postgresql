import React from "react";

export function AmountFormatter(props) {
  return <div>{props.value}</div>;
}

export function PurchaseGridOneCell(props) {
  const {
    Tag,
    cell,
    row,
    col,
    columns,
    attributesRenderer,
    selected,
    editing,
    updated,
    style,
    ...rest
  } = props;

  const attributes = cell.attributes || {};

  // ignore default style handed to us by the component and roll our own
  attributes.style = { padding: 8 };

  return (
    <td {...rest} {...attributes}>
      {props.children}
    </td>
  );
}

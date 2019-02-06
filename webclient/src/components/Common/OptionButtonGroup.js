import React from "react";

export default function OptionButtonGroup(props) {
  return props.items.map((item, index) => {

    return <span key={index}>
      <input
        type="radio"
        name={props.name}
        onChange={props.onChange}
        value={item.value}
      />{" "}
      {item.description}
    </span>
  });
}

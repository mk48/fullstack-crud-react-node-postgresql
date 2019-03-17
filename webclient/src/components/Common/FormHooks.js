import React, { useState, useRef, useEffect } from "react";

export function useFormInput(initialValue) {
  const [value, setValue] = useState(initialValue);

  function handleChange(e) {
    setValue(e.target.value);
  }

  return {
    value,
    setValue,
    onChange: handleChange
  };
}

export function useFormCheckbox(initialValue) {
  const [value, setValue] = useState(initialValue);

  function handleChange(e) {
    setValue(e.target.checked);
  }

  return {
    checked: value,
    onChange: handleChange
  };
}

export function useFormInputSelection(initialValue) {
  const [value, setValue] = useState(initialValue);

  function handleChange(e) {
    setValue(e);
  }

  return {
    value,
    onChange: handleChange
  };
}

export function NumberInputBox(props) {
  const [n, setN] = useState(props.value);
  const inputRef = useRef();

  console.log(props.value);

  useEffect(() => {
    inputRef.current.focus();
  }, []);

  function onChange(e) {
    props.onChange(e.target.value);
    setN(e.target.value);
  }

  return (
    <input
      type="number"
      className="data-editor"
      ref={inputRef}
      value={n}
      onChange={onChange}
      onKeyDown={props.onKeyDown}
    />
  );
}

import { useState } from "react";

export function useFormInput(initialValue) {
  const [value, setValue] = useState(initialValue);

  function handleChange(e) {
    console.log("### useFormInput-handleChange- " + e.target.value);
    setValue(e.target.value);
  }

  console.log("### initvalue: " + initialValue);
  console.log("### actual value- " + value);

  return {
    value,
    onChange: handleChange
  };
}

/*export function useFormInputTextArea(initialValue) {
  const [value, setValue] = useState(initialValue);

  function handleChange(e) {
    setValue(e.target.value);
  }

  return {
    value,
    onChange: handleChange
  };
}*/

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

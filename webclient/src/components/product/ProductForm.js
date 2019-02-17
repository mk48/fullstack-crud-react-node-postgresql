import React from "react";

//Libs

//Local
import OptionButtonGroup from "./../Common/OptionButtonGroup";
import Selection from "./../Common/Selection";
import {
  useFormInput,
  useFormInputTextArea,
  useFormCheckbox,
  useFormInputSelection
} from "./../Common/FormHooks";

//style component
import { Row, Column } from "./../style/grid";

//const date = new Date();
//date.getFullYear() + "-" + date.getMonth() + 1 + "-" + date.getDate(),

const sizeItems = [
  {
    value: 1,
    description: "Small"
  },
  {
    value: 2,
    description: "Medium"
  },
  {
    value: 3,
    description: "Large"
  }
];

export default function ProductForm(props) {
  const nameField = useFormInput(props.name);
  const categoryField = useFormInputSelection(props.category);
  const expiryField = useFormInput(props.expiryDate);
  const isExpiryField = useFormCheckbox(props.isExpiry);
  const priceField = useFormInput(props.price);
  const sizeField = useFormInput(props.size);
  const descriptionField = useFormInputTextArea(props.description);

  console.log("Form - name text: " + nameField.text);

  function handleSubmit(e) {
    e.preventDefault();
    const values = {
      name: nameField.text,
      category: categoryField.value.value,
      expiryDate: expiryField.text,
      isExpiry: isExpiryField.checked,
      price: priceField.text,
      size: sizeField.text,
      description: descriptionField.value
    };
    props.SubmitClick(values);
  }

  return (
    <form onSubmit={handleSubmit}>
      <Row>
        <Column span="3">Name</Column>
        <Column span="9">
          <input type="text" {...nameField} />
        </Column>
      </Row>

      <Row>
        <Column span="3">Category</Column>
        <Column span="9">
          <Selection ApiUrl="category/search" {...categoryField} />
        </Column>
      </Row>

      <Row>
        <Column span="3">Expiry Date</Column>
        <Column span="9">
          <input type="date" {...expiryField} />
        </Column>
      </Row>

      <Row>
        <Column span="3">Is Expiry</Column>
        <Column span="9">
          <input type="checkbox" {...isExpiryField} />
        </Column>
      </Row>

      <Row>
        <Column span="3">Price</Column>
        <Column span="9">
          <input type="number" step="0.25" {...priceField} />
        </Column>
      </Row>

      <Row>
        <Column span="3">Size</Column>
        <Column span="9">
          <OptionButtonGroup name="size" items={sizeItems} {...sizeField} />
        </Column>
      </Row>

      <Row>
        <Column span="3">Name</Column>
        <Column span="9">
          <textarea {...descriptionField} />
        </Column>
      </Row>

      <Row>
        <Column span="3">-</Column>
        <Column span="9">
          <button type="submit">Save</button>
        </Column>
      </Row>
    </form>
  );
}

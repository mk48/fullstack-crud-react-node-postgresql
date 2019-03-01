import React, { useRef, useEffect } from "react";

//Libs

//Local
import OptionButtonGroup from "./../Common/OptionButtonGroup";
import Selection from "./../Common/Selection";
import {
  useFormInput,
  useFormCheckbox,
  useFormInputSelection
} from "./../Common/FormHooks";

//style component
import { Column } from "./../style/grid";
import { FormRow, Button, TextBox } from "./../style/form";

const sizeItems = [
  {
    value: "1",
    description: "Small"
  },
  {
    value: "2",
    description: "Medium"
  },
  {
    value: "3",
    description: "Large"
  }
];

export default function ProductForm(props) {
  const inputElementName = useRef(null);
  const inputElementCategory = useRef(null);
  const inputElementExpiryDate = useRef(null);
  const inputElementIsExpiry = useRef(null);
  const inputElementPrice = useRef(null);
  const inputElementSize = useRef(null);
  const inputElementDescription = useRef(null);
  const inputElementSubmit = useRef(null);

  const nameField = useFormInput(props.data.name);
  const categoryField = useFormInputSelection({
    value: props.data.category_id,
    label: props.data.category.name
  });
  const expiryField = useFormInput(props.data.expiry_date);
  const isExpiryField = useFormCheckbox(props.data.is_expiry);
  const priceField = useFormInput(props.data.price);
  const sizeField = useFormInput(props.data.size);
  const descriptionField = useFormInput(props.data.description);

  //add all elements into array, so that will move next
  let currentFocusElementIndex = 0;
  const AllInputElements = [
    inputElementName,
    inputElementCategory,
    inputElementExpiryDate,
    inputElementIsExpiry,
    inputElementPrice,
    inputElementSize,
    inputElementDescription,
    inputElementSubmit
  ];

  useEffect(() => {
    inputElementName.current.focus();
  }, []);

  function handleSubmit(e) {
    e.preventDefault();
    const values = {
      name: nameField.value,
      category: categoryField.value.value,
      expiryDate: expiryField.value,
      isExpiry: isExpiryField.checked,
      price: priceField.value,
      size: sizeField.value,
      description: descriptionField.value
    };
    props.SubmitClick(values);
  }

  function KeyDownEvent(e) {
    if (e.keyCode === 13) {
      e.preventDefault();
      currentFocusElementIndex++;
      if (AllInputElements[currentFocusElementIndex]) {
        AllInputElements[currentFocusElementIndex].current.focus();
      } else {
        currentFocusElementIndex = 0;
      }
    }
  }

  return (
    <form onSubmit={handleSubmit}>
      <FormRow>
        <Column span="3">
          <label htmlFor="name">Name</label>
        </Column>
        <Column span="9">
          <TextBox
            type="text"
            id="name"
            name="name"
            ref={inputElementName}
            onKeyDown={KeyDownEvent}
            {...nameField}
            required
          />
        </Column>
      </FormRow>

      <FormRow>
        <Column span="3">
          <label htmlFor="category">Category</label>
        </Column>
        <Column span="9">
          <Selection
            ApiUrl="category/search"
            id="category"
            name="category"
            Ref={inputElementCategory}
            onInputKeyDown={KeyDownEvent}
            {...categoryField}
          />
        </Column>
      </FormRow>

      <FormRow>
        <Column span="3">
          <label htmlFor="expiryDate">Expiry Date</label>
        </Column>
        <Column span="9">
          <TextBox
            type="date"
            id="expiryDate"
            name="expiryDate"
            ref={inputElementExpiryDate}
            onKeyDown={KeyDownEvent}
            {...expiryField}
          />
        </Column>
      </FormRow>

      <FormRow>
        <Column span="3">
          <label htmlFor="isExpiry">Is Expiry</label>
        </Column>
        <Column span="9">
          <input
            type="checkbox"
            id="isExpiry"
            name="isExpiry"
            ref={inputElementIsExpiry}
            onKeyDown={KeyDownEvent}
            {...isExpiryField}
          />
        </Column>
      </FormRow>

      <FormRow>
        <Column span="3">
          <label htmlFor="price">Price:</label>
        </Column>
        <Column span="9">
          <TextBox
            type="number"
            id="price"
            name="price"
            step="0.25"
            min="0.25"
            max="99999"
            ref={inputElementPrice}
            onKeyDown={KeyDownEvent}
            {...priceField}
          />
        </Column>
      </FormRow>

      <FormRow>
        <Column span="3">
          <label htmlFor="size">Size:</label>
        </Column>
        <Column span="9">
          <OptionButtonGroup
            name="size"
            items={sizeItems}
            Ref={inputElementSize}
            onKeyDown={KeyDownEvent}
            {...sizeField}
          />
        </Column>
      </FormRow>

      <FormRow>
        <Column span="3">
          <label htmlFor="description">Description:</label>
        </Column>
        <Column span="9">
          <textarea
            id="description"
            name="description"
            ref={inputElementDescription}
            onKeyDown={KeyDownEvent}
            {...descriptionField}
          />
        </Column>
      </FormRow>

      <FormRow>
        <Column span="3">-</Column>
        <Column span="9">
          <Button primary type="submit" ref={inputElementSubmit}>
            {props.mode}
          </Button>
        </Column>
      </FormRow>
    </form>
  );
}

import React from "react";

//Libs
import { Formik } from "formik";
import * as Yup from "yup";

//Local
import { Row, Column } from "./../style/grid";

const ProductSchema = Yup.object().shape({
  name: Yup.string()
    .min(2, "Too Short!")
    .max(50, "Too Long!")
    .required("Required"),
  category: Yup.number().required("Required")
});

const date = new Date();
const InitialValues = {
  name: "",
  category: "1",
  expiryDate:
    date.getFullYear() + "-" + date.getMonth() + 1 + "-" + date.getDate(),
  isExpiry: false,
  price: 0,
  size: 1,
  description: ""
};

const ProductForm = props => (
  <Formik
    initialValues={InitialValues}
    validationSchema={ProductSchema}
    onSubmit={async (values, { setSubmitting, resetForm }) => {
      await props.SubmitClick(values);
      setSubmitting(false);
      resetForm(InitialValues);
    }}
  >
    {({
      values,
      errors,
      touched,
      handleChange,
      handleBlur,
      handleSubmit,
      isSubmitting
    }) => (
      <form onSubmit={handleSubmit}>
        <Row>
          <Column span="3">Name</Column>
          <Column span="9">
            <input
              id="name"
              name="name"
              type="text"
              onChange={handleChange}
              onBlur={handleBlur}
              value={values.name}
            />
          </Column>
        </Row>

        <Row>
          <Column span="3">Category</Column>
          <Column span="9">
            <select
              id="category"
              name="category"
              onChange={handleChange}
              value={values.category}
            >
              <option value="1">Food</option>
              <option value="2">Stationary</option>
              <option value="3">Others</option>
            </select>
          </Column>
        </Row>

        <Row>
          <Column span="3">Expiry Date</Column>
          <Column span="9">
            <input
              type="Date"
              id="expiryDate"
              name="expiryDate"
              onChange={handleChange}
              onBlur={handleBlur}
              value={values.expiryDate}
            />
          </Column>
        </Row>

        <Row>
          <Column span="3">Is Expiry</Column>
          <Column span="9">
            <input
              id="isExpiry"
              name="isExpiry"
              type="checkbox"
              onChange={handleChange}
              onBlur={handleBlur}
              checked={values.isExpiry}
            />
          </Column>
        </Row>

        <Row>
          <Column span="3">Price</Column>
          <Column span="9">
            <input
              id="price"
              name="price"
              type="number"
              onChange={handleChange}
              onBlur={handleBlur}
              checked={values.price}
            />
          </Column>
        </Row>

        <Row>
          <Column span="3">Size</Column>
          <Column span="9">
            <input
              id="size"
              name="size"
              type="radio"
              onChange={handleChange}
              onBlur={handleBlur}
              value={values.size}
            />{" "}
            S
            <input
              id="size"
              name="size"
              type="radio"
              onChange={handleChange}
              onBlur={handleBlur}
              value={values.size}
            />{" "}
            M
            <input
              id="size"
              name="size"
              type="radio"
              onChange={handleChange}
              onBlur={handleBlur}
              value={values.size}
            />{" "}
            L
          </Column>
        </Row>

        <Row>
          <Column span="3">Name</Column>
          <Column span="9">
            <textarea
              id="description"
              name="description"
              onChange={handleChange}
              onBlur={handleBlur}
              checked={values.description}
            />
          </Column>
        </Row>

        <Row>
          <Column span="3">-</Column>
          <Column span="9">
            <button type="submit" disabled={isSubmitting}>
              Save
            </button>
          </Column>
        </Row>
      </form>
    )}
  </Formik>
);

export default ProductForm;

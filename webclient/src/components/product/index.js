import React, { Component } from "react";

//Libs
import axios from "axios";

//Private
import ProductForm from "./ProductForm";

class Product extends Component {
  SaveProduct = async values => {

    console.log(values);

    //load member details
    const toServer = {
      name: values.name,
      category: values.category,
      expiryDate: values.expiryDate,
      isExpiry: values.isExpiry,
      price: values.price,
      size: values.size,
      description: values.description
    };

    try {
      await axios.post(`http://localhost:3001/products`, toServer);
      alert("Saved...");
    } catch (error) {
      console.log(error);
      alert("Error...");
    }
  };

  render() {
    return (
      <div style={{ width: "50%" }}>
        <ProductForm SubmitClick={this.SaveProduct} />
      </div>
    );
  }
}

export default Product;

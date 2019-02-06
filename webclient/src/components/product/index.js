import React, { Component } from "react";

//Libs
import axios from "axios";

//const
import { SERVER_URL } from "./../../util/constant";

//Private
import ProductForm from "./ProductForm";

class Product extends Component {
  SaveProduct = async values => {

    console.log(values);

    //load member details
    const toServer = values;

    try {
      await axios.post(`${SERVER_URL}/products`, toServer);
      alert("Saved...");
    } catch (error) {
      console.log(error);
      alert("Error...");
    }
  };

  render() {
    return (
      <div>
        <ProductForm SubmitClick={this.SaveProduct} />
      </div>
    );
  }
}

export default Product;

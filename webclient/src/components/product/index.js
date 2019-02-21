import React, { useState } from "react";

//Libs

//style component
import { Row, Column } from "./../style/grid";
import { Button} from "./../style/form";

//local

//Private
import ProductView from "./ProductView";
import ProductList from "./ProductList";
import ProductFormEdit from "./ProductFormEdit";
import ProductFormNew from "./ProductFormNew";

export default function Product() {
  const [selectedProductId, setSelectedProductId] = useState(0);
  const [mode, setMode] = useState("");

  
  const ChangeModeToView = id => {
    setMode("view");
    setSelectedProductId(id);
  };

  const ChangeModeToEdit = id => {
    setMode("edit");
    setSelectedProductId(id);
  };

  const ChangeModeToAdd = () => {
    setMode("new");
  };

  let View = null;

  if (mode === "view") {
    View = <ProductView ProductId={selectedProductId} />;
  } else if (mode === "new" ) {
    View = <ProductFormNew/>;
  } else if (mode === "edit") {
    View = <ProductFormEdit ProductId={selectedProductId} />;
  } else {
    View = <div>"select" </div>;
  }

  return (
    <React.Fragment>
      <Row>
        <Column span="4">
          <Button primary onClick={ChangeModeToAdd}>Add new</Button>
        </Column>
      </Row>
      <Row>
        <Column span="4">
          {View} 
        </Column>
        <Column span="8">
          <ProductList
            ViewClick={ChangeModeToView}
            EditClick={ChangeModeToEdit}
          />
        </Column>
      </Row>
    </React.Fragment>
  );
}

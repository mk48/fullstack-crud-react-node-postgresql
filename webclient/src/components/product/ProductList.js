import React, { useEffect, useState } from "react";

//libs
import RTable from "./../Common/ReactTable/Table";
import { Input } from "./../Common/ReactTable/Styles";
import { useTableState } from "react-table";

//style component

//local
import useDataApi from "./../Common/useDataApi";

const columns = [
  //{ Header: "RowIndex", accessor: (row, index) => index, width: 100 },
  {
    Header: "Product name",
    accessor: "name",
    Filter: header => {
      return (
        <Input
          value={header.filterValue || ""}
          onChange={e => header.setFilter(e.target.value)}
        />
      );
    }
  },
  {
    Header: "Category ID",
    accessor: "category_id"
  },
  {
    Header: "Is expiry",
    accessor: "is_expiry"
  },
  {
    Header: "expiry date",
    accessor: "expiry_date"
  },
  {
    Header: "size",
    accessor: "size"
  },
  {
    Header: "price",
    accessor: "price",
    Filter: header => {
      return (
        <Input
          value={header.filterValue || ""}
          onChange={e => header.setFilter(e.target.value)}
        />
      );
    }
  },
  {
    Header: "Description",
    accessor: "description"
  },
  {
    Header: "Actions",
    Cell: data => {
      console.log("Row value: " + data.row.original.id);
      return <div />;
    }
  }
];

export default function ProductList(props) {
  const apiProductList = useDataApi("post", "products/query", []);

  // Make a new controllable table state instance
  const tableState = useTableState({ pageCount: 0 });
  const [{ sortBy, filters, pageIndex, pageSize }, setState] = tableState;

  // When sorting, filters, pageSize, or pageIndex change, fetch new data
  useEffect(async () => {
    const totalRows = await apiProductList.fetch(
      sortBy,
      filters,
      pageIndex,
      pageSize
    );
    console.log("TotRows = " + totalRows);
    const pageCount = Math.ceil(totalRows / pageSize);
    setState(old => ({
      ...old,
      pageCount
    }));
  }, [sortBy, filters, pageIndex, pageSize]);

  return (
    <div>
      <RTable
        data={apiProductList.data}
        columns={columns}
        state={tableState} // Pass the state to the table
        loading={apiProductList.loading}
        manualSorting={true} // Manual sorting
        manualFilters={true} // Manual filters
        manualPagination={true} // Manual pagination
        disableMultiSort={false}
        disableGrouping={true} // Disable grouping
        debug={true}
      />
    </div>
  );
}

/*


    <React.Fragment>
      {apiProductList.isError && <div>Something went wrong ...</div>}

      {apiProductList.isLoading || !apiProductList.data ? (
        <div>Loading ...</div>
      ) : (
        <Table>
          <thead>
            <tr>
              <th>Name</th>
              <th>category_id</th>
              <th>is_expiry</th>
              <th>expiry_date</th>
              <th>size</th>
              <th>price</th>
              <th>description</th>
            </tr>
          </thead>
          <tbody>
            {apiProductList.data.map(item => (
              <tr key={item.id}>
                <td>{item.name}</td>
                <td>{item.category_id}</td>
                <td>{item.is_expiry? "✓" : ""}</td>
                <td>{item.expiry_date}</td>
                <td>{item.size}</td>
                <td>{item.price}</td>
                <td>{item.description}</td>
              </tr>
            ))}
          </tbody>
        </Table>
      )}
    </React.Fragment>

*/

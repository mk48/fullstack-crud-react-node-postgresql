import React, { useEffect } from "react";
import { Link } from "react-router-dom";

//libs
import RTable from "../Common/ReactTable/Table";
import { useTableState } from "react-table";

//local
import useQueryDataApi from "../Common/DataApi/useQueryDataApi";
import useDebouncedCallback from "../Common/useDebouncedCallback";
import { Input } from "../Common/ReactTable/Styles";

//const
import { AUTOSUGGEST_DELAY } from "../../util/constant";

//style component
import { RightAlign } from "../style/rightAlign";

const Columns = [
  //{ Header: "RowIndex", accessor: (row, index) => index, width: 100 },
  {
    Header: "Product name",
    accessor: "name",
    minWidth: 150,
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
    Header: "Category",
    accessor: "category_id",
    Cell: data => <div>{data.row.original.category.name}</div>
  },
  {
    Header: "Is expiry",
    accessor: "is_expiry",
    maxWidth: 70,
    Cell: data => (data.value ? "✓" : "")
  },
  {
    Header: "expiry date",
    accessor: "expiry_date"
  },
  {
    Header: "size",
    accessor: "size",
    maxWidth: 50
  },
  {
    Header: "price",
    accessor: "price",
    Cell: data => <RightAlign>{data.value}</RightAlign>
  },
  /*{
      Header: "Description",
      accessor: "description",
      Filter: header => {
        return (
          <Input
            value={header.filterValue || ""}
            onChange={e => header.setFilter(e.target.value)}
          />
        );
      }
    },*/
  {
    Header: "Actions",
    Cell: data => {
      return (
        <div>
          <Link to={`view/${data.row.original.id}`}>View</Link>
          <Link to={`edit/${data.row.original.id}`}>Edit</Link>
        </div>
      );
    }
  }
];

async function FetchData({
  setState,
  listApi,
  sortBy,
  filters,
  pageIndex,
  pageSize
}) {
  const totalRows = await listApi.fetch(sortBy, filters, pageIndex, pageSize);

  //console.log("TotRows = " + totalRows);
  const pageCount = Math.ceil(totalRows / pageSize);
  setState(old => ({
    ...old,
    pageCount
  }));
}

export default function List() {
  const listApi = useQueryDataApi("post", "products/query", []);
  const debouncedFetchData = useDebouncedCallback(
    FetchData,
    AUTOSUGGEST_DELAY,
    []
  );

  // Make a new controllable table state instance
  const tableState = useTableState({ pageCount: 0 });
  const [{ sortBy, filters, pageIndex, pageSize }, setState] = tableState;

  // When sorting, filters, pageSize, or pageIndex change, fetch new data
  useEffect(() => {
    debouncedFetchData({
      setState,
      listApi,
      sortBy,
      filters,
      pageIndex,
      pageSize
    });
  }, [sortBy, filters, pageIndex, pageSize]);

  return (
    <RTable
      data={listApi.data}
      columns={Columns}
      state={tableState} // Pass the state to the table
      loading={listApi.loading}
      manualSorting={true} // Manual sorting
      manualFilters={true} // Manual filters
      manualPagination={true} // Manual pagination
      disableMultiSort={false}
      disableGrouping={true} // Disable grouping
      debug={false}
    />
  );
}

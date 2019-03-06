import React, { useEffect } from "react";
import { Link } from "react-router-dom";

//libs
import RTable from "./../Common/ReactTable/Table";
import { Input } from "./../Common/ReactTable/Styles";
import { useTableState } from "react-table";

//style component
import { RightAlign } from "./../style/rightAlign";

//local
import useQueryDataApi from "../Common/DataApi/useQueryDataApi";
import useDebouncedCallback from "../Common/useDebouncedCallback";

//const
import { AUTOSUGGEST_DELAY } from "./../../util/constant";

const Columns = [
  //{ Header: "RowIndex", accessor: (row, index) => index, width: 100 },
  {
    Header: "Bill No",
    accessor: "billno",
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
    Header: "Supplier",
    accessor: "supplier_id",
    Cell: data => <div>{data.row.original.supplier.name}</div>
  },
  {
    Header: "Date",
    accessor: "bill_date",
    maxWidth: 70
  },
  {
    Header: "Amount",
    accessor: "amount",
    Cell: data => <RightAlign>{data.value}</RightAlign>
  },
  {
    Header: "Discount %",
    accessor: "discount_percentage",
    maxWidth: 50,
    Cell: data => <RightAlign>{data.value}</RightAlign>
  },
  {
    Header: "Discount",
    accessor: "discount_amount",
    Cell: data => <RightAlign>{data.value}</RightAlign>
  },
  {
    Header: "Total",
    accessor: "tot",
    Cell: data => <RightAlign>{data.value}</RightAlign>
  },
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
  apiPurchaseBillList,
  sortBy,
  filters,
  pageIndex,
  pageSize
}) {
  const totalRows = await apiPurchaseBillList.fetch(
    sortBy,
    filters,
    pageIndex,
    pageSize
  );

  //console.log("TotRows = " + totalRows);
  const pageCount = Math.ceil(totalRows / pageSize);
  setState(old => ({
    ...old,
    pageCount
  }));
}

export default function PurchaseList() {
  const apiPurchaseBillList = useQueryDataApi("post", "purchase/query", []);
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
      apiPurchaseBillList,
      sortBy,
      filters,
      pageIndex,
      pageSize
    });
  }, [sortBy, filters, pageIndex, pageSize]);

  return (
    <RTable
      data={apiPurchaseBillList.data}
      columns={Columns}
      state={tableState} // Pass the state to the table
      loading={apiPurchaseBillList.loading}
      manualSorting={true} // Manual sorting
      manualFilters={true} // Manual filters
      manualPagination={true} // Manual pagination
      disableMultiSort={false}
      disableGrouping={true} // Disable grouping
      debug={false}
    />
  );
}

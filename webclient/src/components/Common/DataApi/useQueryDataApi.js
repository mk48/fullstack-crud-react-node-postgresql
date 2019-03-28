import { useState } from "react";

import Axios  from "./../../../util/Axios";


//concept taken from 
//https://www.robinwieruch.de/react-hooks-fetch-data/

const useQueryDataApi = (apiMethod, url, initialData) => {
  const [data, setData] = useState(initialData);
  //const [totRows, setTotRows] = useState(0);
  //const [toServer, setToServer] = useState(initialToServer);
  const [loading, setLoading] = useState(false);
  const [isError, setIsError] = useState(false);

  const fetchData = async (sortBy, filters, pageIndex, pageSize) => {
    setIsError(false);
    setLoading(true);

    const fullURL = `/${url}`;
    const toServer = {
      sortBy, filters, pageIndex, pageSize
    };


    let totalRows = 0;

    try {
      let result;
      if (apiMethod === "post") {
        result = await Axios.post(fullURL, toServer);
      } else if (apiMethod === "get") {
        result = await Axios.get(fullURL, { params: toServer });
      }

      setData(result.data.rows);
      totalRows = result.data.totalRows;
    } catch (error) {
      setIsError(true);
    }

    setLoading(false);
    return totalRows;
  };

  /*useEffect(() => {
    fetchData();
  }, [toServer]);*/

  const fetch = async(sortBy, filters, pageIndex, pageSize) => {
     const totalRows = await fetchData(sortBy, filters, pageIndex, pageSize);     
     return totalRows;
  };

  return { data, loading, isError, fetch };
};

export default useQueryDataApi;

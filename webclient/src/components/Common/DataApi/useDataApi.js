import { useState } from "react";
import axios from "axios";

//const
import { SERVER_URL } from "./../../../util/constant";

//concept taken from 
//https://www.robinwieruch.de/react-hooks-fetch-data/

const useDataApi = (apiMethod, url, initialData) => {
  const [data, setData] = useState(initialData);
  const [loading, setLoading] = useState(false);
  const [isError, setIsError] = useState(false);

  const fetchData = async (toServer) => {
    setIsError(false);
    setLoading(true);

    const fullURL = `${SERVER_URL}/${url}`;

    try {
      let result;
      if (apiMethod === "post") {
        result = await axios.post(fullURL, toServer);
      } else if (apiMethod === "get") {
        result = await axios.get(fullURL, { params: toServer });
      }

      setData(result.data);
    } catch (error) {
      setIsError(true);
    }

    setLoading(false);
  };

  return { data, loading, isError, fetchData };
};

export default useDataApi;

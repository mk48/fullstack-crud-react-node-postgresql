//Taken from: https://github.com/xnimorz/use-debounce

import { useCallback, useEffect, useRef } from "react";

export default function useDebouncedCallback(callback, delay, deps) {
  const reject = useRef(null);
  const resolve = useRef(null);
  const functionTimeoutHandler = useRef(null);
  const debouncedFunction = useCallback(callback, deps);

  useEffect(
    () => () => {
      clearTimeout(functionTimeoutHandler.current);
    },
    []
  );

  return (...args) => {
    clearTimeout(functionTimeoutHandler.current);
    functionTimeoutHandler.current = setTimeout(() => {
      try {
        const output = debouncedFunction(...args);
        resolve.current(output);
      } catch (e) {
        reject.current(e);
      }
    }, delay);

    const promise = new Promise((res, rej) => {
      resolve.current = res;
      reject.current = rej;
    });

    return promise;
  };
}

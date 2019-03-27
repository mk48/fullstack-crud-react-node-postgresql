import React, { useReducer, useRef, useEffect } from "react";

//libs
import axios from "axios";
import { Redirect } from "react-router-dom";

//style component
import { Column } from "../style/grid";
import { FormRow, Button, TextBox } from "../style/form";

//const
import { SERVER_URL, KEY_ISLOGGEDIN, KEY_USERNAME, KEY_SESSION_ID } from "./../../util/constant";

//========================================== action type ==========================================
const LOGIN = "LOGIN";
const LOGIN_INIT = "LOGIN_INIT";
const LOGIN_SUCCESS = "LOGIN_SUCCESS";
const LOGIN_ERROR = "LOGIN_ERROR";
const USERNAME_CHANGE = "USERNAME_CHANGE";
const PASSWORD_CHANGE = "PASSWORD_CHANGE";

//========================================== reducer Middleware ==========================================
function reducerMiddleware(dispatch) {
  return async action => {
    console.log(action.type, action.data);

    switch (action.type) {
      case LOGIN:
        try {
          const result = await axios.post(`${SERVER_URL}/user/login`, action.data);
          dispatch({ type: LOGIN_SUCCESS, data: result.data });
        } catch (e) {
          dispatch({ type: LOGIN_ERROR });
        }
        break;

      default:
        return dispatch(action);
    }
  };
}

//========================================== reducer ==========================================
function reducer(state, action) {
  //console.log(action.type);

  switch (action.type) {
    case USERNAME_CHANGE:
      return {
        ...state,
        username: action.data
      };

    case PASSWORD_CHANGE:
      return {
        ...state,
        password: action.data
      };

    case LOGIN_INIT:
      return {
        ...state,
        isLoginSuccess: false,
        isProcessing: true,
        message: false
      };

    case LOGIN_SUCCESS:
    //after login, set the local storage value
    localStorage.setItem(KEY_ISLOGGEDIN, true);
    localStorage.setItem(KEY_USERNAME, action.data.userName);
    localStorage.setItem(KEY_SESSION_ID, action.data.sessionId);
      return {
        ...state,
        data: action.data,
        isLoginSuccess: true,
        isProcessing: false,
        isError: false
      };

    case LOGIN_ERROR:
      return {
        ...state,
        isLoginSuccess: false,
        isProcessing: false,
        isError: true
      };

    default:
      return state;
  }
}

//========================================== initial state ==========================================
const initialState = {
  data: {},
  username: "",
  password: "",

  isLoginSuccess: false,
  isProcessing: false, //sending data to DB
  isError: false,
  message: false
};

//========================================== Component ==========================================
export default function Login({ match, location, history }) {
  const [state, dispatchBase] = useReducer(reducer, initialState);
  const dispatch = reducerMiddleware(dispatchBase);

  const inputElementUserName = useRef(null);
  const inputElementPassword = useRef(null);
  const inputElementSubmit = useRef(null);

  //add all elements into array, so that will move next
  const currentFocusElementIndex = useRef(0);

  const AllInputElements = [
    inputElementUserName,
    inputElementPassword,
    inputElementSubmit
  ];

  useEffect(() => {
    //at first time, clear any local storage
    localStorage.removeItem(KEY_USERNAME);
    localStorage.removeItem(KEY_ISLOGGEDIN);
    localStorage.removeItem(KEY_SESSION_ID);
  }, [])

  //------------------------------------ check login, if success then re-direct ---------------
  const { from } = location.state || { from: { pathname: "/home" } };
  if (state.isLoginSuccess) {
    //history.push(from);
    //return null;
    return <Redirect to={from} />;
  }

  function KeyDownEvent(e) {
    if (e.keyCode === 13) {
      e.preventDefault();
      currentFocusElementIndex.current++;
      if (AllInputElements[currentFocusElementIndex.current]) {
        AllInputElements[currentFocusElementIndex.current].current.focus();
      } else {
        currentFocusElementIndex.current = 0;
      }
    }
  }

  async function handleSubmit(e) {
    e.preventDefault();

    dispatch({ type: LOGIN_INIT });
    dispatch({ type: LOGIN, data: {username: state.username, password: state.password} });
  }

  return (
    <form onSubmit={handleSubmit}>
      <FormRow>
        <Column span="3">
          <label htmlFor="userName">User name</label>
        </Column>
        <Column span="9">
          <TextBox
            type="text"
            id="userName"
            name="userName"
            ref={inputElementUserName}
            onKeyDown={KeyDownEvent}
            value={state.username}
            onChange={e =>
              dispatch({ type: USERNAME_CHANGE, data: e.target.value })
            }
          />
        </Column>
      </FormRow>

      <FormRow>
        <Column span="3">
          <label htmlFor="password">Password</label>
        </Column>
        <Column span="9">
          <TextBox
            type="password"
            id="password"
            name="password"
            ref={inputElementPassword}
            onKeyDown={KeyDownEvent}
            value={state.password}
            onChange={e =>
              dispatch({ type: PASSWORD_CHANGE, data: e.target.value })
            }
          />
        </Column>
      </FormRow>

      <FormRow>
        <Column span="3">-</Column>
        <Column span="9">
          <Button primary type="submit" ref={inputElementSubmit}>
            Login
          </Button>
        </Column>
      </FormRow>

      {state.isProcessing && <div>Processing...</div>}
      {state.isError && <div>User name or password not correct</div>}
    </form>
  );
}

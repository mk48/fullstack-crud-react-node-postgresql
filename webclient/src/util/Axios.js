import axios from "axios";

import {SERVER_URL, KEY_SESSION_ID} from "./constant";

axios.defaults.baseURL = SERVER_URL;

//for dev - while changing react-js file, browser will reload, that time axios won't have token set
const sessionId = localStorage.getItem(KEY_SESSION_ID);
if (sessionId){
    SetToken(sessionId);
}

export function SetToken(tokenId){
    axios.defaults.headers.common = {'x-access-token': tokenId};
}

export function ClearToken(){
    axios.defaults.headers.common = '';
}

export default axios;
import styled from "styled-components";
import { Row } from "./grid";

export const FormRow = styled(Row)`
  margin: 1em;
`;

export const Form = styled.div`
  display: grid;
  grid-template-columns: auto auto;
  background-color: gray;
`;

export const FormItem = styled.div`
  padding: 5px;
  background-color: #2196f3;
`;

export const Button = styled.button`
  background: ${props => (props.primary ? "rgb(28, 184, 65)" : "#555555")};
  font-size: 16px;
  color: white;
  padding: 7px 15px;
  border-style: none;
  text-align: center;
  display: inline-block;
  border: none;
  border-radius: 4px;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
`;

export const TextBox = styled.input`
  padding: 6px 10px;
  font-size: 15px;
  box-sizing: border-box;
`;

export const Radio = styled.input`
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 18px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;

  input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
  }
`;

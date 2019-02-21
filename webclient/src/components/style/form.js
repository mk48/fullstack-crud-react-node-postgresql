import styled from "styled-components";
import {Row} from "./grid";

export const FormRow = styled(Row)`
  margin: 1em
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
  background: ${props => (props.primary ? "#4CAF50" : "#e7e7e7")};
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  font-size: 0.9em;
  padding: 0.25em 0.25em;
  border: none;
`;

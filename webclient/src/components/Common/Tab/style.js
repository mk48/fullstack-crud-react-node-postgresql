import styled, { css } from "styled-components";

export const Header = styled.div`
  padding-left: 0;
`;

export const HeaderItem = styled.div`
  display: inline-block;
  list-style: none;
  margin-bottom: -1px;
  padding: 0.5rem 0.75rem;
  border: solid #ccc;
  border-radius: 6px 6px 0 0;
  border-width: 1px 1px 0 1px;
  cursor:pointer;
  
  ${props =>
    props.isActive &&
    css`
      font-weight:bold;
      border-top: 4px solid #05abe0;
      background-color: white;
    `}
`;

export const TabContent = styled.div`
  border: 1px solid #ccc;
`;

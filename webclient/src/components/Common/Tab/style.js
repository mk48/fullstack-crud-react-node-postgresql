import styled, { css } from "styled-components";

export const Header = styled.div`
  padding-left: 0;
`;

export const HeaderItem = styled.div`
  display: inline-block;
  list-style: none;
  margin-bottom: -1px;
  padding: 0.5rem 0.75rem;

  ${props =>
    props.isActive &&
    css`
      background-color: white;
      border: solid #ccc;
      border-width: 1px 1px 0 1px;
    `}
`;

export const TabContent = styled.div`
border: 1px solid #ccc;
`;
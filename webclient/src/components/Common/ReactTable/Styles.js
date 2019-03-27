import styled, { css } from "styled-components";

export const Table = styled.div`
  display: block;
  //border-radius: 5px;
  border: solid 1px #ddd;
  overflow: scroll;
`;

const RowBase = styled.div`
  display: flex;
  border-bottom: solid 1px #e1dddd;
  
  :last-child {
    border-bottom: 0;
  }
`;

export const Row = styled(RowBase)`
  ${props =>
    props.even &&
    css`
      background: rgba(193, 195, 196, 0.12);
    `}
`;

export const HeaderRow = styled(RowBase)` 
  border-bottom: solid 1px rgba(0, 0, 0, 0.2);
  color: #232020;
`;

export const Pagination = styled(RowBase)`
   color: black;
`;

export const Cell = styled.div`
  border-right: solid 1px rgba(0, 0, 0, 0.1);
  padding: 0.6rem;

  :last-child {
    border-right: 0;
  }
`;

export const Header = styled(Cell)`
  font-weight: bold;

  ${props => {
    const width = (props.sortedIndex + 1) * 5;
    return (
      props.sorted &&
      (props.sortedDesc
        ? css`
            box-shadow: inset 0 ${width}px hsla(0, 100%, 40%);
          `
        : css`
            box-shadow: inset 0 -${width}px hsl(55, 100%, 50%);
          `)
    );
  }};
`;

export const Button = styled.button`
  font-size: 1rem;
  padding: 0.5rem 0.7rem;
  cursor: pointer;
  border:none;

  :disabled {
    opacity: 0.3;
  }
`;

export const Select = styled.select`
  appearance: none;
  background: white;
  border: 0;
  margin: 0;
  color: black;
  font-size: 1rem;
  border-radius: 5px;
  padding: 0.5rem 0.7rem;
  border: 0;
  cursor: pointer;
`;

export const Input = styled.input`
  font-size: 1rem;
  padding: 0.5rem 0.7rem;
  background: white;
  border-radius: 5px;
  border: 1px solid rgba(0, 0, 0, 0.2);
  width: 100%;
  box-sizing: border-box;  
`;

export const Emoji = styled.span`
  font-size: 1rem;
  margin: 0 0.3rem;
  display: inline-block;
  transform: scale(1.4);
`;

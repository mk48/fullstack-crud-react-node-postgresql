//re-calculate the row like, Amount = Mrp x Qty
export function RecalculateRow(grid, srno) {
    const gridUpdated = grid.map((row, i) => {
      if (row.srno === srno) {
        return { ...row, qty_mrp: row.qty * row.mrp };
      } else {
        return row;
      }
    });
    return gridUpdated;
  }
  
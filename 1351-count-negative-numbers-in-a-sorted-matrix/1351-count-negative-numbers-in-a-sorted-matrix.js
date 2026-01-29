/**
 * @param {number[][]} grid
 * @return {number}
 */

var countNegatives = function(grid) {
  const m = grid.length;
  const n = grid[0].length;

  let r = m - 1;  // bottom row
  let c = 0;      // leftmost column
  let count = 0;

  while (r >= 0 && c < n) {
    if (grid[r][c] < 0) {
      count += (n - c);
      r--; //  up
    } else {
      c++; // right
    }
  }

  return count;
};

/**
 * @param {string} s
 * @return {number}
 */
function numSub(s) {
  const MOD = 1000000007n;
  let ans = 0n;
  let run = 0n;

  for (const ch of s) {
    if (ch === '1') {
      run += 1n;     // extend streak
      ans = (ans + run) % MOD;  // add all substrings ending here
    } else {
      run = 0n;      // reset streak
    }
  }

  return Number(ans);
}

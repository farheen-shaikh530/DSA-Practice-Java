/**
 * @param {number[]} nums
 * @return {number[]}
 */
function getSumAbsoluteDifferences(nums) {

    const n = nums.length;
    const ans = new Array(n);

    let total = 0;
    for(const x of nums) total +=x;

let leftSum = 0;
for(let i = 0; i< n; i++){
    const x = nums[i];

    const rightSum = total - leftSum - x;

    const leftCount = i;
    const rightCount = n - i -1;

    ans[i] = (x * leftCount - leftSum) + (rightSum - x * rightCount);
    leftSum+= x;

}
return ans;

}
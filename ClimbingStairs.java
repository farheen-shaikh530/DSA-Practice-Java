class Solution {
    public int climbStairs(int n) {
        if(n==1) return n;
        if(n==2) return n;
        int oneStepBefore = 2;
        int twoStepBefore = 1;
        int result =0;
        for(int i = 3; i <= n; i++){
            result = twoStepBefore + oneStepBefore;
            twoStepBefore = oneStepBefore;
            oneStepBefore = result;
        }
        return result;
        
    }
}
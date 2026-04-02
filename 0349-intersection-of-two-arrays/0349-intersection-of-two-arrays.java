class Solution {
    public int[] intersection(int[] nums1, int[] nums2) {
        Set<Integer> set1 = new HashSet<>();
        Set<Integer> result1 = new HashSet<>();

        for(int n : nums1){
            set1.add(n);
        }
    for(int n : nums2){
        if(set1.contains(n)){
            result1.add(n);
        }

}
int[] res = new int[result1.size()];
int i = 0;
for(int n : result1){
    res[i++] = n;
}
return res;

    }
}
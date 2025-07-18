import java.util.HashMap;
import java.util.Map;

public class TwoSumSolution {

    public static int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> numMap = new HashMap<>(); 
        for (int i = 0; i < nums.length; i++) {
            int complement = target - nums[i];

            if (numMap.containsKey(complement)) {
                return new int[] { numMap.get(complement), i };
            }

            numMap.put(nums[i], i);
        }

        throw new IllegalArgumentException("No two sum solution");
    }

    public static void main(String[] args) {
        int[] nums = {2, 7, 11, 15}; // ✅ Correct array declaration
        int target = 9;

        int[] result = twoSum(nums, target); // ✅ Correct method call
        System.out.println("[" + result[0] + ", " + result[1] + "]");
    }
}



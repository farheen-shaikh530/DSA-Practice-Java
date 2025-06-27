public class SearchInsertPosition {
    public static int searchInsert(int[] nums, int target) {
        int left = 0, right = nums.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            if (nums[mid] == target) {
                return mid; // target found
            } else if (nums[mid] < target) {
                left = mid + 1; // look in right half
            } else {
                right = mid - 1; // look in left half
            }
        }

        // target not found, return insert position
        return left;
    }

    public static void main(String[] args) {
        int[] nums = {1, 3, 5, 6};
        int target = 5;
        System.out.println("Insert position: " + searchInsert(nums, target)); // Output: 2
    }
}
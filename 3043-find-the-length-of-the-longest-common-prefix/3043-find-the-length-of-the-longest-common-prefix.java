class Solution {

    static class Node {
        Node[] next = new Node[10];
    }

    public int longestCommonPrefix(int[] arr1, int[] arr2) {

        Node root = new Node();

        // Build trie from arr1
        for (int num : arr1) {
            String s = String.valueOf(num);
            Node curr = root;

            for (int i = 0; i < s.length(); i++) {
                int digit = s.charAt(i) - '0';
                if (curr.next[digit] == null) {
                    curr.next[digit] = new Node();
                }
                curr = curr.next[digit];
            }
        }

        int maxPrefix = 0;

        // Query trie with arr2
        for (int num : arr2) {
            String s = String.valueOf(num);
            Node curr = root;
            int count = 0;

            for (int i = 0; i < s.length(); i++) {
                int digit = s.charAt(i) - '0';
                if (curr.next[digit] == null) break;
                curr = curr.next[digit];
                count++;
            }

            maxPrefix = Math.max(maxPrefix, count);
        }

        return maxPrefix;
    }
}
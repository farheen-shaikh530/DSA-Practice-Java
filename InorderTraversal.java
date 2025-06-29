import java.util.*;

class TreeNode {
    int val;
    TreeNode left, right;

    TreeNode(int val) {
        this.val = val;
    }
}

public class InorderTraversal {
    public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> result = new ArrayList<>();
        traverseInorder(root, result);
        return result;
    }

    private void traverseInorder(TreeNode node, List<Integer> result) {
        if (node == null) return;
        traverseInorder(node.left, result);
        result.add(node.val);
        traverseInorder(node.right, result);
    }

    // Example use case
    public static void main(String[] args) {
        TreeNode root = new TreeNode(1);
        root.right = new TreeNode(2);
        root.right.left = new TreeNode(3);

        InorderTraversal solution = new InorderTraversal();
        List<Integer> output = solution.inorderTraversal(root);
        System.out.println(output);  // Output: [1, 3, 2]
    }
}
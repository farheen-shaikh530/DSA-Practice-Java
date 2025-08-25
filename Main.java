import java.util.*;          // For List, ArrayList, HashMap, HashSet, etc.
import java.io.*; 

class ListNode{
    int val;
    ListNode next;

    ListNode(){}

    //add value to the linked list 
    ListNode(int val){ 
        this.val=val;
    }
    //create a next node with value
      ListNode(int val, ListNode next ){
        this.val=val;
         this.next=next;

    }
 
// Build a list from a string like "[1,1,2,3,3]" or "[]"
    public static ListNode deserialize(String s) {
        if (s == null) return null;
        s = s.trim();
        if (s.length() == 0 || s.equals("[]")) return null;

        // strip brackets if present
        if (s.charAt(0) == '[' && s.charAt(s.length()-1) == ']') {
            s = s.substring(1, s.length() - 1);
        }
        if (s.trim().isEmpty()) return null;

        String[] parts = s.split(",");
        ListNode dummy = new ListNode(0);
        ListNode cur = dummy;
        for (String p : parts) {
            int v = Integer.parseInt(p.trim());
            cur.next = new ListNode(v);
            cur = cur.next;
        }
        return dummy.next;
    }

    // Optional: convert list back to "[...]" for debugging
    public String serialize() {
        StringBuilder sb = new StringBuilder();
        sb.append('[');
        ListNode cur = this;
        while (cur != null) {
            sb.append(cur.val);
            cur = cur.next;
            if (cur != null) sb.append(',');
        }
        sb.append(']');
        return sb.toString();
    }

}

class Solution {
    public ListNode deleteDuplicates(ListNode head) {
        ListNode current = head;

        while(current != null && current.next != null){
            
        if(current.val == current.next.val){
        //skip
        current.next=current.next.next;
}

else{
    current = current.next;

}
        }

        return head;

    }
}
// ---- local runner ----
public class Main {
    public static void main(String[] args) {
        // Example: [1,1,2,3,3] -> [1,2,3]
        ListNode head = ListNode.deserialize("[1,1,2,3,3]");
        ListNode dedup = new Solution().deleteDuplicates(head);
        System.out.println(dedup == null ? "[]" : dedup.serialize());
    }
}

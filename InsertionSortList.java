class ListNode {
    int val;
    ListNode next;

    ListNode() {}
    ListNode(int val) { this.val = val; }
    ListNode(int val, ListNode next) { this.val = val; this.next = next; }
}

public class InsertionSortList {
    public ListNode insertionSortList(ListNode head) {
        // Create a dummy node to act as the new head of the sorted list
        ListNode dummy = new ListNode(0);
        ListNode current = head;

        while (current != null) {
            // At each iteration, insert current into the sorted part
            ListNode prev = dummy;

            // Find the correct position to insert the current node
            while (prev.next != null && prev.next.val < current.val) {
                prev = prev.next;
            }

            // Save the next node to process
            ListNode nextTemp = current.next;

            // Insert current between prev and prev.next
            current.next = prev.next;
            prev.next = current;

            // Move to the next node
            current = nextTemp;
        }

        return dummy.next;
    }
}

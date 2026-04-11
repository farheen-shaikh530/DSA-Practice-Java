class Solution {
    public ListNode reverseKGroup(ListNode head, int k) {
        if (head == null || k == 1) return head;

        ListNode dummy = new ListNode(0);
        dummy.next = head;

        ListNode prevGroup = dummy;
        ListNode end = dummy;

        while (true) {

            // move end pointer k steps
            for (int i = 0; i < k && end != null; i++) {
                end = end.next;
            }

            if (end == null) break;

            ListNode start = prevGroup.next;
            ListNode nextGroup = end.next;

            end.next = null;

            // reverse current k group
            prevGroup.next = reverse(start);

            start.next = nextGroup;

            prevGroup = start;
            end = prevGroup;
        }

        return dummy.next;
    }

    private ListNode reverse(ListNode head) {
        ListNode prev = null;
        ListNode curr = head;

        while (curr != null) {
            ListNode next = curr.next;
            curr.next = prev;
            prev = curr;
            curr = next;
        }

        return prev;
    }
}
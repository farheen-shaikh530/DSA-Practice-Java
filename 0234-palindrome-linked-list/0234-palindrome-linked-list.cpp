class Solution {

public:

    bool isPalindrome(ListNode* head) {

        vector<int> v;

        // Step 1: Copy values

        while (head != NULL) {

            v.push_back(head->val);

            head = head->next;

        }

        // Step 2: Initialize pointers AFTER filling vector

        int left = 0;

        int right = v.size() - 1;

        // Step 3: Compare

        while (left < right) {

            if (v[left] != v[right]) {

                return false;

            }

            left++;

            right--;

        }

        return true;

    }

};
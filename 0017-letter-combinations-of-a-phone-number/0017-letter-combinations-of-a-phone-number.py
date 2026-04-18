from typing import List

class Solution:

    def letterCombinations(self, digits: str) -> List[str]:

        if not digits:

            return []

        phone = {

            "2": "abc", "3": "def", "4": "ghi",

            "5": "jkl", "6": "mno", "7": "pqrs",

            "8": "tuv", "9": "wxyz"

        }

        result = []

        def backtrack(index, path):

            # base case

            if index == len(digits):

                result.append(path)

                return

            curr_digit = digits[index]

            letters = phone[curr_digit]

            for ch in letters:

                backtrack(index + 1, path + ch)

        # start recursion (ONLY ONCE)

        backtrack(0, "")

        return result
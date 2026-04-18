class Solution:

    def reorganizeString(self, s: str) -> str:

        from collections import Counter

        freq = Counter(s)

        n = len(s)

        # Step 1: most frequent char

        max_char = max(freq, key=freq.get)

        max_count = freq[max_char]

        # Step 2: feasibility check

        if max_count > (n + 1) // 2:

            return ""

        # Step 3: result array

        res = [""] * n

        i = 0

        # Step 4: place most frequent char

        while freq[max_char] > 0:

            res[i] = max_char

            i += 2

            freq[max_char] -= 1

        # Step 5: fill remaining chars

        for ch in freq:

            while freq[ch] > 0:

                if i >= n:

                    i = 1  # switch to odd indices

                res[i] = ch

                i += 2

                freq[ch] -= 1

        return "".join(res)
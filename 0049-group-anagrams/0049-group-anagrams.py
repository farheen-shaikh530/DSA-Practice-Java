class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        from collections import defaultdict

        group = defaultdict(list)

        for word in strs:
            key = "".join(sorted(word))
            group[key].append(word)

        return list(group.values())

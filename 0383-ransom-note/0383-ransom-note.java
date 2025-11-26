class Solution {
    public boolean canConstruct(String ransomNote, String magazine) {

        int[] count = new int[26];

        // count magazine chars
        for(char c : magazine.toCharArray()){
            count[c - 'a']++;
        }

        // check ransomNote chars
        for(char c : ransomNote.toCharArray()){
            count[c - 'a']--;
            if(count[c - 'a'] < 0){
                return false; // ran out of letters
            }
        }

        return true;
    }
}
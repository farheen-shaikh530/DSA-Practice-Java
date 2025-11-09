class Solution {
    public boolean wordPattern(String pattern, String s) {
        String[] word = s.split(" ");
      
        if(word.length != pattern.length()) return false;
        
        Map<Character, String> p2w = new HashMap<>();
        Map<String, Character> w2p = new HashMap<>();

        for(int i = 0 ; i < pattern.length(); i++){
            char c = pattern.charAt(i);
            String w = word[i];

         

 String mappedWord = p2w.get(c);
Character mappedChar = w2p.get(w);

            if(mappedWord == null && mappedChar == null)
            {
                p2w.put(c, w);
                w2p.put(w, c);
            }
        else{
            
            if(!w.equals(mappedWord)|| c!= mappedChar) return false;

            }
        }
        return true;


    
    }
}
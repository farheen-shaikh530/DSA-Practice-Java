import java.util.HashMap;

class Solution {
    public static int romanToInt(String s) {
        HashMap<Character, Integer> romanmap = new HashMap<>();

        romanmap.put('I',1);
        romanmap.put('V',5);
         romanmap.put('X',10);
          romanmap.put('L',50);
           romanmap.put('C',100);
            romanmap.put('D',500);
            romanmap.put('M',1000);

            int total=0;
            int previousval=0;

            for(int i = s.length() - 1; i >= 0; i--){
            int currentVal = romanmap.get(s.charAt(i));

                if (currentVal<previousval)
                {
                    total-=currentVal;
                }
                else{
                total+=currentVal; 
                }

                previousval=currentVal;
                 }
                return total;
            }

 public static void main(String[] args) {
        String roman = "LVIII";
        System.out.println("Integer value for " + roman + " is " + romanToInt(roman));
    }
}
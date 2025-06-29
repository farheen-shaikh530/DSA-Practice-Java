public class RomanToInteger {
    public static int romanToInt(String s) {
        int result = 0;
        int prev = 0;

        for (int i = s.length() - 1; i >= 0; i--) {
            int curr = value(s.charAt(i));

            if (curr < prev) {
                result -= curr;
            } else {
                result += curr;
            }

            prev = curr;
        }

        return result;
    }

    private static int value(char c) {
        return switch (c) {
            case 'I' -> 1;
            case 'V' -> 5;
            case 'X' -> 10;
            case 'L' -> 50;
            case 'C' -> 100;
            case 'D' -> 500;
            case 'M' -> 1000;
            default -> 0;
        };
    }
// Daily update for GitHub streak
    public static void main(String[] args) {
        String roman = "MCMXCIV";
        System.out.println("The integer value of " + roman + " is " + romanToInt(roman));
    }

}

public class ClimbingStairs {
    
    public int climbStairs(int n) {
        if (n <= 2) return n;

        int first = 1;
        int second = 2;
        int total = 0;

        for (int i = 3; i <= n; i++) {
            total = first + second;
            first = second;
            second = total;
        }

        return second;
    }

    public static void main(String[] args) {
        ClimbingStairs cs = new ClimbingStairs();
        int n = 5; // Example input
        System.out.println("Ways to climb " + n + " stairs: " + cs.climbStairs(n));
    }

}

class Solution {
    public int strongPasswordChecker(String password) {

        int n = password.length();

        boolean lower = false, upper = false, digit = false;

        for (char c : password.toCharArray()) {
            if (Character.isLowerCase(c)) lower = true;
            else if (Character.isUpperCase(c)) upper = true;
            else if (Character.isDigit(c)) digit = true;
        }

        int missing = (lower ? 0 : 1) + (upper ? 0 : 1) + (digit ? 0 : 1);

        int replace = 0;
        int[] arr = new int[n];

        for (int i = 0; i < n;) {
            int j = i;
            while (i < n && password.charAt(i) == password.charAt(j)) i++;
            arr[j] = i - j;
        }

        if (n < 6) {
            return Math.max(missing, 6 - n);
        }

        if (n <= 20) {

            for (int len : arr) {
                replace += len / 3;
            }

            return Math.max(missing, replace);
        }

        int delete = n - 20;
        int remainingDelete = delete;

        for (int i = 0; i < n && remainingDelete > 0; i++) {
            if (arr[i] >= 3 && arr[i] % 3 == 0) {
                arr[i]--;
                remainingDelete--;
            }
        }

        for (int i = 0; i < n && remainingDelete > 0; i++) {
            if (arr[i] >= 3 && arr[i] % 3 == 1) {
                int need = Math.min(2, remainingDelete);
                arr[i] -= need;
                remainingDelete -= need;
            }
        }

        for (int i = 0; i < n && remainingDelete > 0; i++) {
            if (arr[i] >= 3) {
                int need = Math.min(arr[i] - 2, remainingDelete);
                arr[i] -= need;
                remainingDelete -= need;
            }
        }

        for (int len : arr) {
            replace += len / 3;
        }

        return delete + Math.max(missing, replace);
    }
}
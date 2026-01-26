    class Bank {
        private long[] balance;

        public Bank(long[] balance) {
            this.balance = balance;
        }
        private boolean valid(int account){
            return account >= 1 && account <= balance.length;
        }
        
        public boolean transfer(int account1, int account2, long money) {
            if(!valid(account1) || !valid(account2)) return false;

            int a1= account1 -1,  a2= account2 - 1;

            if(balance[a1] < money) return false;
            balance[a1] -= money;
            balance[a2] += money;
            return true;

        }
        


        public boolean deposit(int account, long money) {
            if(!valid(account)) return false;
            balance[account - 1] += money;
            return true;

        }
        
        public boolean withdraw(int account, long money) {
            if(!valid(account)) return false;
        int idx = account -1;

if (balance[idx] < money) return false; 

        balance[idx] -= money;
        return true;

        }
    }

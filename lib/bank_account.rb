class BankAccount
    attr_reader :name, :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amt)
        @balance += amt
    end

    def withdrawl(amt)
        if @balance >= amt
            @balance = self.balance - amt
        end
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def status
        @status
    end

    def status=(s)
        @status = s
    end

    def balance=(num)
        @balance = num
    end

    def balance
        @balance
    end

    def valid?
        result = false
        if self.balance > 0 && self.status == "open"
            result = true
        end
        result

    end

    def close_account
        self.status = "closed"
    end

end
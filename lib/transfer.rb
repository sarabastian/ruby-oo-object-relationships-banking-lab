require './lib/bank_account.rb'
class Transfer
  attr_reader :sender, :receiver, :status, :amount

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @status = "pending"
        @amount = amount
    end

    def status
      @status
    end

    def status=(s)
      @status = s
    end

    def receiver
      @receiver
    end

    def receiver=(r)
      @receiver = r
    end

    def sender
      @sender
    end

    def sender=(s)
      @sender = s
    end

    def valid?
      result = false
      if self.sender.valid? && self.receiver.valid?
        result = true
      end
      result
    end

    def execute_transaction
      amt = self.amount

      if @status == "pending" && self.valid? && self.sender.balance >= amt
        self.sender.withdrawl(amt)
        self.receiver.deposit(amt)
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end 

    def reverse_transfer
      amt = self.amount
      if @status == "complete"
        self.receiver.withdrawl(amt)
        self.sender.deposit(amt)
        self.status = "reversed"
      end
    end
end
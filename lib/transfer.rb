


class Transfer
    
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount=50, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def reject_transaction
    if self.valid? == false 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def pre_transaction
    self.receiver.balance += self.amount
    self.sender.balance -= self.amount
    self.status = "complete"
    self.amount = 0
  end

  def execute_transaction
    self.pre_transaction
    self.reject_transaction 
  end

  def reverse_transfer
    if self.status == "complete"
    self.amount = 50
    self.receiver.balance -= self.amount
    self.sender.balance += self.amount
    self.status = "reversed"
    end
  end
end

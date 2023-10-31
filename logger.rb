require "logger"

class BankAccount
  attr_accessor :name
  attr_reader :logger, :transations

  def initialize(name)
    @name = name
    @transations = []
    @logger = Logger.new("account.txt")
  end

  def deposit(amount)
    logger.info "[#{name}] deposited #{amount}"
    transations.push(amount)
  end

  def withdraw(amount)
    logger.info("[#{name}] Withdraw #{amount}")
    transations.push(-amount)
  end
end

account = BankAccount.new("Jason")
account.deposit 100
account.withdraw 50
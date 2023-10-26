class BankAccount
  attr_reader :name

  def initialize(name)
    @name = name
    @transactions = []
    add_transaction("Beginning Balance", 0)
  end

  def credit(description, amount)
    add_transaction(description, amount)
  end

  def debit(description, amount)
    add_transaction(description, -amount)
  end

  # creating methods to add transactions
  def add_transaction(description, amount)
    @transactions.push(description: description, amount: amount)
  end

  def balance
    balance = 0
    @transactions.each do |transaction|
      balance += transaction[:amount]
    end
    return balance # do not need return statement
  end

  def to_s
    "Name: #{name}, Balance: #{sprintf("%0.2f", balance)}"
  end

  def print_register
    puts "#{name}'s Bank Account"

    puts "-" * 40
    puts "Description".ljust(30) + "Amount".rjust(10)
    @transactions.each do |transaction|
      #puts transaction[:description] + "\t" + sprintf("%0.2f", transation[:amount])
      puts transaction[:description].ljust(30) + sprintf("%0.2f", transaction[:amount]).rjust(10)
    end

    puts "-" * 40
    puts "Balance:".ljust(30) + sprintf("%0.2f", balance).rjust(10)
    puts "-" * 40
  end

end

# instanciate new instance of bank account and assigned it to a variable
bank_account = BankAccount.new("Jason")
bank_account.credit("Paycheck", 100)
bank_account.debit("Groceries", 40)
bank_account.debit("gas", 10.31)
puts bank_account
puts "Register:"
bank_account.print_register
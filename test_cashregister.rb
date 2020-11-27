require 'minitest/autorun'
require_relative 'cash_register'
require_relative ' transaction'

class Test_register < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_amount
    register.test_accept_money(transaction)
    current_amount = register.total_money

    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)

    transaction.amount_paid = 30
    
    assert_equal(10, register.change(transaction))
  end

  def test_give_receipt
    item_cost = 20
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end

  

  end
end


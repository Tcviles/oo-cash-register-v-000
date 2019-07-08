require 'pry'

class CashRegister
  attr_accessor :total,:discount,:items
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @prices = {}
  end

  def add_item(item, price, qty = 1)
    @total += price*qty
    qty.times do
      @items<<item
      @prices[item]=price
    end
  end

  def apply_discount
    #binding.pry
    if @discount > 0
      deduction = (@discount*@total)/100
      @total = @total - deduction
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    item = @items.pop
    @total = @total - (@prices[item])
  end
end

class Receipt
  def initialize(terminal, order) # takes an order object
    @terminal = terminal
    @order = order
  end

  def itemised_bill_formatted
    print_receipt_header
    print_customer
    print_bill
    print_grand_total
  end

  def order
    @order
  end

  private

  def grand_total
    order.basket.map { |item| item[:dish].price * item[:qty] }.sum
  end

  def print_grand_total
    @terminal.puts "Grand total: £#{grand_total}"
  end

  def print_bill
    if order.basket.empty?
      @terminal.puts "Nothing ordered!"
    else
      order.basket.each do |item|
        @terminal.puts "#{item[:dish].name} (£#{item[:dish].price}) x #{item[:qty]}"
      end
    end
  end

  def print_customer
    @terminal.puts "Customer: #{order.customer.name}"
  end

  def print_receipt_header
    @terminal.puts "---Receipt---"
  end
end
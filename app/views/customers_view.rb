class CustomersView
  def ask_for_string(label)
    puts "What's the #{label}?"
    gets.chomp
  end

  def ask_for_integer(label)
    puts "What's the #{label}?"
    gets.chomp.to_i
  end

  def display(customers)
    customers.each do |customer|
      puts "- #{customer.name} - #{customer.address}"
    end
  end
end

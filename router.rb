class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to the Food Delivery"
    while @running
      display_menu
      dispatch
    end
    puts "Goodbye!"
  end

  private

  def display_menu
    puts "---"
    puts "1. Add a meal"
    puts "2. List meals"
    puts "3. Add customer"
    puts "4. List customers"
    puts "0. Quit"
    puts "---"
  end

  def dispatch
    print "> "
    user_input = gets.chomp.to_i
    print `clear`
    case user_input
    #                  controller#action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 0 then @running = false
    else
      puts "Not a valid input."
    end
  end
end

class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
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
    puts "1. Add a meal"
    puts "0. Quit"
  end

  def dispatch
    user_input = gets.chomp.to_i
    case user_input
    when 1 then @meals_controller.add
    when 0 then @running = false
    else
      puts "Not a valid input."
    end
  end
end

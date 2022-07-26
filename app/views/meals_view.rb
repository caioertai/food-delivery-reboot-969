class MealsView
  def ask_for_string(label)
    puts "What's the #{label}?"
    gets.chomp
  end

  def ask_for_integer(label)
    puts "What's the #{label}?"
    gets.chomp.to_i
  end

  def display(meals)
    meals.each do |meal|
      puts "- #{meal.name} ($#{meal.price})"
    end
  end
end

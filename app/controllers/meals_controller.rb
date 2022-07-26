require_relative "../models/meal"
require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def add
    # Ask VIEW for name
    meal_name = @meals_view.ask_for_string("name")
    # Ask VIEW for price
    meal_price = @meals_view.ask_for_integer("price")
    # Ask MODEL for instance of meal
    new_meal = Meal.new(name: meal_name, price: meal_price)
    # Ask REPO to save it
    @meal_repository.create(new_meal)
  end

  def list
    # Ask REPO for all meals
    meals = @meal_repository.all
    # Ask VIEW to display them
    @meals_view.display(meals)
  end
end

require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "router"

meal_repo = MealRepository.new("data/meals.csv")
meals_controller = MealsController.new(meal_repo)

router = Router.new(meals_controller)

router.run

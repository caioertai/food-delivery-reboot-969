require "csv"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @meals = []

    load_csv if File.exists?(@csv_path)
  end

  def all
    @meals
  end

  def create(new_meal)
    new_meal.id = next_id
    @meals << new_meal

    update_csv
  end

  private

  def update_csv
    CSV.open(@csv_path, "wb") do |file|
      file << %w[id name price]
      @meals.each do |meal|
        file << [meal.id, meal.name, meal.price]
      end
    end
  end

  def next_id
    @meals.empty? ? 1 : @meals.last.id + 1
  end

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      # ROW
      # { id: "1", name: "pizza", price: "10"}
      # TYPE CASTING
      row[:id] = row[:id].to_i # "1".to_i => 1
      row[:price] = row[:price].to_i # "10".to_i => 10

      # row => { id: 1, name: "pizza", price: 10}
      @meals << Meal.new(row)
    end
  end
end

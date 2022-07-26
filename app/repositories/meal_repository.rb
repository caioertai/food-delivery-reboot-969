require "csv"
require_relative "base_repository"
require_relative "../models/meal"

class MealRepository < BaseRepository
  private

  def update_csv
    CSV.open(@csv_path, "wb") do |file|
      file << %w[id name price]
      @elements.each do |meal|
        file << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      # TYPE CASTING
      row[:id] = row[:id].to_i # "1".to_i => 1
      row[:price] = row[:price].to_i # "10".to_i => 10

      @elements << Meal.new(row)
    end
  end
end

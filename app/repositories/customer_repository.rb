require "csv"
require_relative "base_repository"
require_relative "../models/customer"

class CustomerRepository < BaseRepository
  private

  def update_csv
    CSV.open(@csv_path, "wb") do |file|
      file << %w[id name address]
      @elements.each do |customer|
        file << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      # TYPE CASTING
      row[:id] = row[:id].to_i # "1".to_i => 1

      @elements << Customer.new(row)
    end
  end
end

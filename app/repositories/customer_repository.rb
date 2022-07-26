require "csv"
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @customers = []

    load_csv if File.exists?(@csv_path)
  end

  def all
    @customers
  end

  def create(new_customer)
    new_customer.id = next_id
    @customers << new_customer

    update_csv
  end

  private

  def next_id
    @customers.empty? ? 1 : @customers.last.id + 1
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |file|
      file << %w[id name address]
      @customers.each do |customer|
        file << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      # TYPE CASTING
      row[:id] = row[:id].to_i # "1".to_i => 1

      @customers << Customer.new(row)
    end
  end
end

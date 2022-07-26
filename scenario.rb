require_relative "app/repositories/customer_repository"

customer_repository = CustomerRepository.new("data/customers.csv")

p customer_repository

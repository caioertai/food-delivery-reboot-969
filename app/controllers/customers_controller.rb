require_relative "../models/customer"
require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def add
    # Ask VIEW for attributes
    customer_name = @customers_view.ask_for_string("name")
    customer_address = @customers_view.ask_for_string("address")
    # Ask MODEL
    new_customer = Customer.new(name: customer_name, address: customer_address)
    # Ask REPO
    @customer_repository.create(new_customer)
  end

  def list
    # Ask REPO
    customers = @customer_repository.all
    # Ask VIEW
    @customers_view.display(customers)
  end
end

require_relative '../env'

FactoryGirl.define do

  factory :inventory, class: Inventory do
    id "123"
    href "localhost:4567/inventory/id/123"
    type "type"
    price 20.50
    quantity 100
    name "name"
    description "description"
    companyId "123"
    props []
  end

end
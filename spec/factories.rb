FactoryBot.define do
  factory :animal do
    name "Winslow"
    species "Dog"
    sex "M"
    birthday Date.new(2014, 1, 1)
    description "A sweet and friendly corgi who loves swimming and playing fetch."
    arrival_date Date.new(2017, 12, 1)
  end
end

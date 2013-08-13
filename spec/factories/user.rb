FactoryGirl.define do
  factory :user, :class => Compartment::User do
    email 'user@example.com'
    password 'password'
  end
end

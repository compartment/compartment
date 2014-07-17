FactoryGirl.define do
  factory :theme, :class => Compartment::Theme do
    name 'default'

    factory :custom_theme do
      name 'custom_test_theme'
    end
  end
end
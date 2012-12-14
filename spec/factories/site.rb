FactoryGirl.define do

  factory :site, :class => Compartment::Site do
    domain 'example.com'
    theme

    factory :full_site, :class => Compartment::Site do
      after(:create) do |site, evaluator|
        FactoryGirl.create(:page, site: site)
      end
    end
  end
end
FactoryGirl.define do

  factory :site, :class => Compartment::Site do
    domain 'example1.lvh.me'

    factory :full_site, :class => Compartment::Site do
      after(:create) do |site, evaluator|
        FactoryGirl.create(:page_with_content, site: site)
      end
    end
  end
end
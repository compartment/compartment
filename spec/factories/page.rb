FactoryGirl.define do

  factory :page, :class => Compartment::Page do
    site
    title 'homepage'
    path '/'
    template 'one_column'

    factory :page_with_content do
      after(:create) do |page, evaluator|
        FactoryGirl.create_list(:content_block, 3, page: page)
      end
    end
  end

end
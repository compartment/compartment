# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :compartment_admin_content_block, :class => 'Admin::ContentBlock' do
    data "MyText"
    page nil
  end
end

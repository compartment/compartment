FactoryGirl.define do

  factory :content_block, :class => Compartment::ContentBlock do
    content_area 'body'
    data 'some data'
  end

end
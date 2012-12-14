require 'spec_helper'

describe Compartment::ContentBlock do
  it { should belong_to :content_area }

  describe '#render' do
    it 'renders data by default' do
      subject.data = 'random html data'
      subject.render.should == 'random html data'
    end
  end
end
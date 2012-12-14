require 'spec_helper'

describe Compartment::Theme do
  it { should belong_to :site }
  it { should have_attribute :name }

  describe '#default' do
    it 'returns a default theme' do
      theme = Compartment::Theme.default
      theme.should be_a Compartment::Theme
      theme.name.should == 'default'
    end
  end

  describe '#path' do
    it 'calculates the file path' do
      Compartment.config.themes_path = '/my/themes'
      subject.name = 'foo'
      subject.path.should == '/my/themes/foo'
    end
  end
end
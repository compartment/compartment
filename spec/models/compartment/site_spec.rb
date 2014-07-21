require 'spec_helper'

describe Compartment::Site do
  it { should have_many :users }
  it { should have_many :pages }
  it { should validate_uniqueness_of :domain }

  describe '#theme' do
    it 'defaults to the default theme' do
      site = Compartment::Site.create!(default: true)
      site.theme.should be_a Compartment::Theme
      site.theme.name.should == 'Compartment Default'
    end
  end

  describe '#default?' do
    it 'returns boolean value' do
      site = Compartment::Site.create!(default: true)
      site.reload
      site.default?.should be_true
      site.update_attributes(default: false)
      site.reload
      site.default?.should be_false
    end
  end
end
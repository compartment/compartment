require 'spec_helper'

describe Compartment::Site do
  it { should have_many :users }
  it { should have_many :pages }
  it { should have_one :theme }
  it { should validate_uniqueness_of :domain }


  describe '#default?' do
    it 'returns the persisted value of default' do
      site = Compartment::Site.create(default: true)
      site.reload
      site.default?.should be_true
      site.update_attributes(default: false)
      site.reload
      site.default?.should be_false
    end
  end
end
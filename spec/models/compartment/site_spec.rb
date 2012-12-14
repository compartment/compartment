require 'spec_helper'

describe Compartment::Site do
  it { should have_many :pages }
  it { should have_one :theme }
  it { should validate_uniqueness_of :domain }
end
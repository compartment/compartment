require 'spec_helper'

describe Compartment::Site do
  it { should have_many :pages }
  it { should validate_uniqueness_of :domain }
end
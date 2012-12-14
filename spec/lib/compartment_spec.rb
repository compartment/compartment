require 'spec_helper'

describe Compartment do

  describe '#config' do
    it 'returns an instance of Compartment::Config' do
      Compartment.config.should be_instance_of Compartment::Config
    end
  end
end
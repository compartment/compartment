require 'spec_helper'

describe Compartment::User do
  it { should belong_to :site }

end

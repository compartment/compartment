require 'spec_helper'

describe Compartment::Config do

  describe '#theme_dir_path' do
    it 'can be set and retrieved' do
      subject.themes_path = '/foo/bar'
      subject.themes_path.should == '/foo/bar'
    end
  end
end
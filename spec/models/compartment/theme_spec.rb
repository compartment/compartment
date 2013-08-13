require 'spec_helper'

describe Compartment::Theme do

  describe '.info' do
    it 'has an info class method' do
      Compartment::Theme.should respond_to(:info)
    end
  end

  it { should belong_to :site }
  it { should have_attribute :name }
  it { should validate_presence_of :name }

  describe '.default' do
    it 'returns the default theme' do
      theme = Compartment::Theme.default
      theme.should be_a Compartment::Theme
      theme.name.should == 'default'
    end
  end

  describe '#filepath' do
    it 'calculates the file path' do
      Compartment.config.themes_path = '/my/themes'
      subject.name = 'foo'
      subject.filepath.should == '/my/themes/foo'
    end
  end

  describe '#path_to_template' do
    let(:subject) { Compartment::Theme.default }
    it 'returns a Pathname object' do
      path = subject.path_to_template('example')
      path.should == "/my/themes/#{subject.name}/templates/example"
    end
  end

  describe '#url' do
    it 'returns the asset url of the theme' do
      subject.url.should == "/assets/themes/#{subject.name}/"
    end
  end


  describe '#url_to_file' do
    it 'returns the url to the file' do
      url = subject.url_to_file('example.html')
      url.should == "/assets/themes/#{subject.name}/example.html"
    end
  end

end
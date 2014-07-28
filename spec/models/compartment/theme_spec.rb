require 'spec_helper'

describe Compartment::Theme do

  describe '#initialize' do
    it 'accepts a hash of attributes' do
      theme = Compartment::Theme.new(name: 'foobar')
      theme.name.should == 'foobar'
    end
  end

  describe '.default' do
    it 'returns the default theme' do
      theme = Compartment::Theme.default
      theme.should be_a Compartment::Theme
      theme.name.should == 'Compartment Default'
    end
  end

  describe '#base_path' do
    it 'returns the path to the directory where the theme spec file lives' do
      theme = Compartment::Theme.default
      theme.base_path.should == File.expand_path('../../../../app/themes/default', __FILE__)
    end
  end

  # describe '#filepath' do
  #   it 'calculates the file path' do
  #     Compartment.config.themes_path = '/my/themes'
  #     subject.name = 'foo'
  #     subject.filepath.should == '/my/themes/foo'
  #   end
  # end

  describe '#template_path' do
    let(:subject) { Compartment::Theme.default }
    it 'returns the filepath to the template' do
      path = subject.template_path('example')
      path.should == "#{subject.base_path}/templates/example"
    end
  end

  describe '#asset_url_path' do
    let(:subject) { Compartment::Theme.default }
    it 'returns the URL path to the asset' do
      path = subject.asset_path('example.css')
      path.should == "/assets/themes/#{subject.name}/example.css"
    end
  end

  describe '#asset_filepath' do
    let(:subject) { Compartment::Theme.default }
    it 'returns the filepath to the asset' do
      path = subject.asset_filepath('stylesheets/example.css')
      path.should == "#{subject.base_path}/stylesheets/example.css"
    end
  end

  # describe '#url' do
  #   it 'returns the asset url of the theme' do
  #     subject.url.should == "/assets/themes/#{subject.name}/"
  #   end
  # end


  # describe '#url_to_file' do
  #   it 'returns the url to the file' do
  #     url = subject.url_to_file('example.html')
  #     url.should == "/assets/themes/#{subject.name}/example.html"
  #   end
  # end

  describe '#templates' do
    let(:subject) { Compartment::Theme.default }

    it 'returns an array of available templates' do
      templates = subject.templates
      templates.count.should == 2
      templates[0].name.should == 'One Column'
      templates[0].filename.should == 'one_column'
      templates[1].name.should == 'Two Column'
      templates[1].filename.should == 'two_column'
    end
  end

end
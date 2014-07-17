require 'spec_helper'

describe Compartment::Page do

  it { should have_many :content_blocks }
  it { should have_attribute :template }
  it { should have_attribute :title }
  it { should have_attribute :path }

  it { should validate_presence_of(:site_id) }
  it { should validate_uniqueness_of(:path).scoped_to(:site_id) }
  it { should validate_presence_of(:template) }

  describe '#template_path' do
    let(:theme) { FactoryGirl.create(:theme) }
    let(:site) { FactoryGirl.create(:site, theme: theme) }
    let(:page) { FactoryGirl.create(:page, site: site, template: 'layout.html') }

    it 'returns the path to the specified template' do
      page.should_receive(:site).and_return(site)
      site.should_receive(:theme).and_return(theme)
      theme.should_receive(:path_to_template).with('layout.html').and_return('/example/theme/dir/layout.html')
      page.template_path.should == '/example/theme/dir/layout.html'
    end
  end

end
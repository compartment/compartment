require 'spec_helper'

describe Compartment::Page do

  it { should have_many :content_blocks }
  it { should have_attribute :template }
  it { should have_attribute :title }
  it { should have_attribute :path }

  it { should validate_presence_of(:path) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:template) }
  it { should validate_presence_of(:site_id) }
  it { should validate_uniqueness_of(:path).scoped_to(:site_id) }

  describe '#template_path' do
    let(:site) { FactoryGirl.create(:site) }
    let(:page) { FactoryGirl.create(:page, site: site, template: 'layout.html') }

    it 'returns the path to the specified template' do
      site.theme.should_receive(:template_path).with('layout.html').and_return('/example/theme/dir/layout.html')
      page.template_path.should == '/example/theme/dir/layout.html'
    end
  end

end

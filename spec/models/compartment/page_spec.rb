require 'spec_helper'

describe Compartment::Page do
  it { should have_attribute :url_path }
  it { should have_attribute :title }
  it { should have_attribute :layout }
  it { should validate_uniqueness_of :url_path }
  it { should have_many :content_areas }

  describe '#layout_path' do
    let(:theme) { create(:theme) }
    let(:site) { create(:site, theme: theme) }
    let(:page) { create(:page, site: site, layout: 'layout.html') }
    it 'returns the full layout path' do
      page.should_receive(:site).and_return(site)
      site.should_receive(:theme).and_return(theme)
      theme.should_receive(:path).and_return('/example/theme/dir')
      page.layout_path.should == '/example/theme/dir/layout.html'
    end
  end

end
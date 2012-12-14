require 'spec_helper'

describe Compartment::PagesHelper do

  let(:site) { create(:site) }
  let(:page) { create(:page, site: site) }

  describe '#page_title' do
    before do
      @page = page
    end
    it 'displays the page title' do
      result = page_title
      result.should == @page.title
    end
  end

  describe '#content_area' do

    context 'no content areas' do
      before do
        @page = page
      end
      it 'renders nil' do
        result = content_area('something')
        result.should be_nil
      end
    end

    context 'with a content area' do
      let(:page) { create(:page_with_content) }
      before do
        @page = page
      end
      it 'renders the content area' do
        result = content_area('body')
        result.should_not be_nil
      end
    end
  end
end
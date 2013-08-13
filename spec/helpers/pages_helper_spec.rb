require 'spec_helper'

describe Compartment::PagesHelper do

  def logged_in
    helper.should_receive(:admin_logged_in?).and_return(true)
  end

  def not_logged_in
    helper.should_receive(:admin_logged_in?).and_return(false)
  end

  let(:site) { create(:site) }
  let(:page) { create(:page, site: site) }
  before do
    @page = page
  end

  describe '#styles' do

    context 'not logged in' do
      it 'returns nil' do
        not_logged_in
        helper.styles.should be_nil
      end
    end

    context 'logged in' do
      it 'renders link tags' do
        logged_in
        helper.styles.should == '<link href="/assets/compartment/frontend-styles.css" media="screen" rel="stylesheet" type="text/css" />'
      end
    end
  end

  describe '#page_title' do
    before do
      @page = page
    end
    it 'displays the page title' do
      @page.title.should == 'homepage'
      result = page_title
      result.should == @page.title
    end
  end

  # let(:content_area) { subject }

  # describe '#render' do
  #   context 'without content blocks' do
  #     it 'returns an empty string' do
  #       content_area.render.should == ''
  #     end
  #   end

  #   context 'with a content blocks' do
  #     before do
  #       content_area.content_blocks.build(data: 'content1')
  #       content_area.content_blocks.build(data: 'content2')
  #     end
  #     it 'renders each content block' do
  #       result = content_area.render
  #       result.should include('content1')
  #       result.should include('content2')
  #     end
  #   end
  # end

  describe '#content_area' do

    context 'when not logged in' do
      before { not_logged_in }

      context 'no content blocks' do
        it 'renders an empty string' do
          result = helper.content_area('something')
          result.should == ''
        end
      end
    end

    context 'when logged in' do
      before { logged_in }

      it 'wraps each content block with a content area div' do
        pending 'TODO'
      end
    end

    # context 'no content areas' do
    #   before do
    #     @page = page
    #   end
    #   it 'renders an empty string' do
    #     result = content_area('something')
    #     result.should == ''
    #   end
    # end

    # context 'with a content area' do
    #   let(:page) { create(:page_with_content) }

    #   before do
    #     @page = page
    #   end
      
    #   context 'without content blocks' do
    #     it 'returns an empty string' do
    #       content_area.render.should == ''
    #     end
    #   end

    #   context 'with a content blocks' do
    #     before do
    #       content_area.content_blocks.build(data: 'content1')
    #       content_area.content_blocks.build(data: 'content2')
    #     end
    #     it 'renders each content block' do
    #       result = content_area.render
    #       result.should include('content1')
    #       result.should include('content2')
    #     end
    #   end
    # end
  end
end
require 'spec_helper'

describe Compartment::ContentArea do
  it { should have_many :content_blocks }

  let(:content_area) { subject }

  describe '#render' do
    context 'without content blocks' do
      it 'returns an empty string' do
        content_area.render.should == ''
      end
    end

    context 'with a content blocks' do
      before do
        content_area.content_blocks.build(data: 'content1')
        content_area.content_blocks.build(data: 'content2')
      end
      it 'renders each content block' do
        result = content_area.render
        result.should include('content1')
        result.should include('content2')
      end
    end
  end
end
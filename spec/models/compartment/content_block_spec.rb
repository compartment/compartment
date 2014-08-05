require 'spec_helper'

describe Compartment::ContentBlock do
  it { should belong_to :page }

  describe '#render' do
    it 'renders data by default' do
      subject.data = 'random html data'
      subject.render.should == 'random html data'
    end
  end

  describe 'subclasses' do
    before { Object.constants.should_not include(:FancyBlock) }
    after { Object.send(:remove_const, :FancyBlock) }

    it 'automatically registers the content block type' do
      Compartment.registered_content_blocks.count.should == 2
      FancyBlock = Class.new(Compartment::ContentBlock)
      Compartment.registered_content_blocks.count.should == 3
      Compartment.registered_content_blocks.should include FancyBlock
    end

    describe '.name' do
      it 'allows you to define a name' do
        class FancyBlock < Compartment::ContentBlock
          content_block_name 'Fancy Block'
        end
        FancyBlock.content_block_name.should == 'Fancy Block'
      end
    end

    describe '.description' do
      it 'allows you to define a description' do
        class FancyBlock < Compartment::ContentBlock
          content_block_description 'A fancy kind of content block'
        end
        FancyBlock.content_block_description.should == 'A fancy kind of content block'
      end
    end

    describe '.metadata' do
      subject do
        class FancyBlock < Compartment::ContentBlock
          content_block_name 'Fancy Block'
          content_block_description 'A fancy kind of content block'
        end
        FancyBlock
      end

      it 'returns a hash of metadata' do
        subject.metadata.should == {
          class: 'FancyBlock',
          name: 'Fancy Block',
          description: 'A fancy kind of content block'
        }
      end
    end
  end

end
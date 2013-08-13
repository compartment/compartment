module Compartment
  module ContentBlockDsl

    def self.included(base)
      base.extend ClassMethods
      Compartment.config.content_block_types << base
    end

    module ClassMethods

      def name(name)
        @name = name
      end

      def description(desc)
        @description = desc
      end

      def to_json
        { name: @name, description: @description }.to_json
      end
    end

  end
end
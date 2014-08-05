module Compartment
  class Config

    def logger
      @logger ||= Rails.logger
    end
    
  end
end
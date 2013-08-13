module Compartment
  class User < ActiveRecord::Base
    belongs_to :site
    attr_accessible :email, :password, :password_confirmation
    has_secure_password
    validates_presence_of :password, :on => :create
  end
end

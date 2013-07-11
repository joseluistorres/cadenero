module Cadenero
  # Defines a user of one or more accounts for the multitenant  Rails App
  class User < ActiveRecord::Base
    has_secure_password
    has_many :accounts, class_name: "Cadenero::V1::Account", foreign_key: "owner_id"
    has_many :members, class_name: "Cadenero::Member"
    has_many :memberships, through: :members, source: :account

    # Obtain the authentication_token from the account to be use for the User
    def auth_token      
      accounts[0].authentication_token if accounts[0]
    end
  
  end
end

class User < ActiveRecord::Base
end

class LdapUser < User
  devise :ldap_authenticatable, :rememberable, :trackable
end

class LocalUser < User
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :trackable
end
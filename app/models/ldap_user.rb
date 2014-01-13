require 'user'

class LdapUser < User
  devise :ldap_authenticatable, :rememberable, :trackable
end
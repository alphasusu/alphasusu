class LdapUser < User
  devise :ldap_authenticatable, :rememberable, :trackable
  
  after_create :get_ldap_names
  
  def get_ldap_names
    self.first_name = Devise::LDAP::Adapter.get_ldap_param(self.email, 'givenName').first
    self.last_name = Devise::LDAP::Adapter.get_ldap_param(self.email, 'sn').first
    self.save
  end
end

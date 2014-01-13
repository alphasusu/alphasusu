require 'user'

class LocalUser < User
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :trackable
end
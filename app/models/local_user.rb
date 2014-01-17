class LocalUser < User
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :trackable, :validatable
  
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email
end

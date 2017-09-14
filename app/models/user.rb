class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable

  has_many :projects
  
  validates_presence_of :email, :encrypted_password, :first_name, :last_name

  before_save :capitalize_name
  before_save :set_full_name
  
  private
    def capitalize_name
      first_name.capitalize!
      last_name.capitalize!
    end

    def set_full_name
      full_name = "#{first_name} #{last_name}".strip
    end
end

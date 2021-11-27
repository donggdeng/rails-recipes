class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
  has_many :memberships
  has_many :groups, through: :memberships
  has_one :profile

  def display_name
    self.email.split("@").first
  end 
end

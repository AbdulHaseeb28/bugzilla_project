class User < ApplicationRecord
  
  has_many :bugs
  has_many :project_users
  has_many :projects, through: :project_users
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

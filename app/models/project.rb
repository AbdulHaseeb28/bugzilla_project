class Project < ApplicationRecord
  belongs_to :user
  has_many :bugs
  has_many :project_users
  has_many :users, through: :project_users
  enum user_type: { developer: 0, manager: 1, qa: 2 }
  attr_accessible :name, :description
end

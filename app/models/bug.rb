class Bug < ApplicationRecord

  belongs_to :user #creater
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id', optional: true # Developer 
  belongs_to :project #project


  validates :title, presence: true, uniqueness: { scope: :project_id }
  validates :status,presence: true, inclusion: { in: %w(new started completed) }
  validates :type, presence: true, inclusion: { in: %w(feature bug) }

 # mount_uploader :screenshot, ScreenshotUploader # Assuming you're using CarrierWave or similar for file uploads
end

#bug model
class Bug < ApplicationRecord
  self.inheritance_column = :bug_type
  # belongs_to :user #creater
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id', optional: true # Developer 
  belongs_to :project #project
   #validations
  validates :title, presence: true, uniqueness: { scope: :project_id }
  validates :status,presence: true, inclusion: { in: %w(new started completed) }
  validates :type, presence: true, inclusion: { in: %w(feature bug) }
  validate :valid_screenshot_format
  validate :validate_status_based_on_type

  private

  def validate_status_based_on_type
    if type == 'feature'
      unless %w(new started completed).include?(status)
        errors.add(:status, 'Status must be new, started, or completed for a feature')
      end
    elsif type == 'bug'
      unless %w(new started resolved).include?(status)
        errors.add(:status, 'Invalid status for a feature. Choose from: new, started, or completed.')
      end
    end
  end

  def valid_screenshot_format
    if screenshot.present? && !valid_screenshot_extension?
      errors.add(:screenshot, 'should be in PNG or GIF format')
    end
  end

  def valid_screenshot_extension?
    allowed_extensions = %w(image/png image/gif)
    allowed_extensions.include?(screenshot.content_type)
  end
end

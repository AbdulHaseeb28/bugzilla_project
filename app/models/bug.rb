class Bug < ApplicationRecord
  self.inheritance_column = :bug_type
  belongs_to :user #creater
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
        errors.add(:status, 'Status must be new, started, or resolved for a bug')
      end
    end
  end

  def valid_screenshot_format
    if screenshot.present? && !screenshot.file.extension.downcase.in?(%w(png gif))
      errors.add(:screenshot, 'should be in PNG or GIF format')
    end
  end
end

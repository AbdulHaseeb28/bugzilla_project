#create bugs
class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.date :deadline
      t.binary :screenshot
      t.string :type
      t.string :status
      t.integer :user_id
      t.integer :developer_id
      t.integer :project_id

      t.timestamps
    end
  end
end

class CreateColdEmails < ActiveRecord::Migration[8.0]
  def change
    create_table :cold_emails do |t|
      t.integer :goal, null: false
      t.string :goal_details, null: false
      t.text :email_content, null: false, default: ""
      t.belongs_to :recipient
      t.belongs_to :sender

      t.timestamps
    end
  end
end

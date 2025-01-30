class CreateColdEmails < ActiveRecord::Migration[8.0]
  def change
    create_table :cold_emails do |t|
      t.integer :goal, null: false
      t.string :goal_details, null: false
      t.text :email_content, null: false, default: ""
      t.references :recipient, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: true

      t.timestamps
    end
  end
end

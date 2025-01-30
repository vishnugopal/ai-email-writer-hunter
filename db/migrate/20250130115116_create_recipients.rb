class CreateRecipients < ActiveRecord::Migration[8.0]
  def change
    create_table :recipients do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.string :organization, null: false
      t.string :organization_website, null: false
      t.text :personalization_hints
      t.integer :type_of_recipient

      t.timestamps
    end
  end
end

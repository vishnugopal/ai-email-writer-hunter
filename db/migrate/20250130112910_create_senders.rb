class CreateSenders < ActiveRecord::Migration[8.0]
  def change
    create_table :senders do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.string :organization, null: false
      t.string :organization_website, null: false
      t.text :contact_details

      t.timestamps
    end
  end
end

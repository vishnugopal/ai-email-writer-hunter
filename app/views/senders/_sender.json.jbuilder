json.extract! sender, :id, :name, :title, :organization, :organization_website, :contact_details, :created_at, :updated_at
json.url sender_url(sender, format: :json)

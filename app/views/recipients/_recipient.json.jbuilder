json.extract! recipient, :id, :name, :title, :organization, :organization_website, :personalization_hints, :type_of_recipient, :created_at, :updated_at
json.url recipient_url(recipient, format: :json)

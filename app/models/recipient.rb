class Recipient < ApplicationRecord
  has_many :cold_emails
  enum :type_of_recipient, customer: 0, client: 10, partner: 20

  def self.all_as_options
    Recipient.all.map { |s| { s["name"] => s["id"] } }.reduce({}, :merge)
  end
end

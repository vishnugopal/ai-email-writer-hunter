class Sender < ApplicationRecord
  has_many :cold_emails

  def self.all_as_options
    Sender.all.map { |s| { s["name"] => s["id"] } }.reduce({}, :merge)
  end
end

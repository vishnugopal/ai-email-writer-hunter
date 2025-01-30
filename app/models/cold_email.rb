class ColdEmail < ApplicationRecord
  include ActionView::RecordIdentifier

  enum :goal, initiate_connection: 0, present_an_opportunity: 10, generate_leads: 20, seek_a_specific_outcome: 30

  belongs_to :recipient
  belongs_to :sender
  validates :goal, :goal_details, :recipient, :sender, presence: true

  after_update_commit -> { broadcast_updated }

  def self.goals_as_options
    goals.keys.map { |s| { s.humanize => s } }.reduce({}, :merge)
  end

  def broadcast_updated
    broadcast_replace_to(
        "#{dom_id(self)}_progress",
        partial: "cold_emails/cold_email",
        locals: { cold_email: self },
        target: "#{dom_id(self)}"
      )
  end
end

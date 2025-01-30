class ColdEmailsController < ApplicationController
  def index
    goal = :initiate_connection
    goal_details = "Hello!"
    recipient = Recipient.first
    sender = Sender.first
    logger.info render_to_string("cold_emails/prompt", locals: { goal: goal, goal_details: goal_details, recipient: recipient, sender: sender })
  end
end

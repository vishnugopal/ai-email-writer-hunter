class ColdEmail < ApplicationRecord
  DEVELOPER_PROMPT_TEMPLATE = <<~PROMPT
    Generate a cold email with these parameters:

    Type of recipient: customer
    Goal: Present an opportunity
    Goal details: Product: Hunter.io, your all-in-one email outreach platform.

    Receipient details:

    Name: Vishnu Gopal
    Title: CTO
    Organization: Diffect
    Organization website: vishnugopal.com
    Personalization hints: Vishnu has a deep interest in hiring technical leaders right now.

    Sender details:

    Name: John Smith
    Title: Customer Outreach Manager
    Organization: Hunter
    Organization website: Hunter.io

    A good cold email will have these characteristics:

    - **Personalization:** Even though it's unsolicited, a good cold email often includes personalized elements to make it relevant to the recipient.
    - **Clear Purpose:** It clearly states the reason for reaching out.
    - **Conciseness:** It is brief and to the point to respect the recipient's time.
    - **Value Proposition:** It highlights why the recipient should care or benefit from engaging with the sender.
    - **Call-to-Action (CTA):** It includes a specific request, such as scheduling a meeting, answering a question, or providing feedback.

    Provide only the email and no other commentary.
  PROMPT

  validates :goal, :goal_details, presence: true
  enum :goal, initiate_connection: 0, present_an_opportunity: 10, generate_leads: 20, seek_a_specific_outcome: 30

  def generate
    response = openai_client.chat(
      parameters: {
        model: "gpt-4o",
        messages: [ { role: "user", content: ColdEmail::DEVELOPER_PROMPT_TEMPLATE } ],
        temperature: 0.8
      }
    )
    puts response.dig("choices", 0, "message", "content")
  end

  private
  def openai_client
    OpenAI::Client.new(access_token: Rails.application.credentials.openai.access_token!)
  end
end

class ColdEmail < ApplicationRecord
  enum :goal, initiate_connection: 0, present_an_opportunity: 10, generate_leads: 20, seek_a_specific_outcome: 30

  belongs_to :recipient
  belongs_to :sender
  validates :goal, :goal_details, :recipient, :sender, presence: true

  def generate(prompt:)
    response = openai_client.chat(
      parameters: {
        model: "gpt-4o",
        messages: [ { role: "user", content: prompt } ],
        temperature: 0.8
      }
    )
    response.dig("choices", 0, "message", "content")
  end

  def self.goals_as_options
    goals.keys.map { |s| { s.humanize => s } }.reduce({}, :merge)
  end

  private

  def openai_client
    OpenAI::Client.new(access_token: Rails.application.credentials.openai.access_token!)
  end
end

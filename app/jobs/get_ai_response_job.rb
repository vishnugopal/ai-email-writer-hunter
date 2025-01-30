class GetAiResponseJob < ApplicationJob
  queue_as :default

  def perform(cold_email_id, prompt)
    openai_client.chat(
      parameters: {
        model: "gpt-4o",
        messages: [ { role: "user", content: prompt } ],
        temperature: 0.8,
        stream: stream_proc(cold_email_id:)
      }
    )
  end

  def stream_proc(cold_email_id:)
    cold_email = ColdEmail.find(cold_email_id)
    proc do |chunk, _bytesize|
      new_content = chunk.dig("choices", 0, "delta", "content")
      finish_reason = chunk.dig("choices", 0, "finish_reason")

      if new_content
        cold_email.email_content = cold_email.email_content.to_s + new_content
        cold_email.broadcast_updated
      end

      if finish_reason.present?
        cold_email.save!
      end
    end
  end

  def openai_client
    OpenAI::Client.new(access_token: Rails.application.credentials.openai.access_token!)
  end
end

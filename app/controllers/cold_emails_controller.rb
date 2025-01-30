class ColdEmailsController < ApplicationController
  before_action :set_cold_email, only: %i[ show ]

  def index
    @cold_emails = ColdEmail.all
  end

  def new
    @cold_email = ColdEmail.new
  end

  def show
  end

  def create
    @cold_email = ColdEmail.new(cold_email_params)
    prompt = render_to_string("cold_emails/prompt", locals: {
      goal: @cold_email.goal, goal_details: @cold_email.goal_details, recipient: @cold_email.recipient, sender: @cold_email.sender
    })

    respond_to do |format|
      if @cold_email.save
        GetAiResponseJob.perform_later @cold_email.id, prompt
        format.html { redirect_to @cold_email, notice: "Cold Email was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cold_email
    @cold_email = ColdEmail.find(params.expect(:id))
  end

  def cold_email_params
    params.expect(cold_email: [ :goal, :goal_details, :sender_id, :recipient_id ])
  end
end

class SendersController < ApplicationController
  before_action :set_sender, only: %i[ show edit update destroy ]

  # GET /senders or /senders.json
  def index
    @senders = Sender.all
  end

  # GET /senders/1 or /senders/1.json
  def show
  end

  # GET /senders/new
  def new
    @sender = Sender.new
  end

  # GET /senders/1/edit
  def edit
  end

  # POST /senders or /senders.json
  def create
    @sender = Sender.new(sender_params)

    respond_to do |format|
      if @sender.save
        format.html { redirect_to @sender, notice: "Sender was successfully created." }
        format.json { render :show, status: :created, location: @sender }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /senders/1 or /senders/1.json
  def update
    respond_to do |format|
      if @sender.update(sender_params)
        format.html { redirect_to @sender, notice: "Sender was successfully updated." }
        format.json { render :show, status: :ok, location: @sender }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /senders/1 or /senders/1.json
  def destroy
    @sender.destroy!

    respond_to do |format|
      format.html { redirect_to senders_path, status: :see_other, notice: "Sender was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sender
      @sender = Sender.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sender_params
      params.expect(sender: [ :name, :title, :organization, :organization_website, :contact_details ])
    end
end

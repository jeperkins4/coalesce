class MessagesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  expose(:messages) {  Message.all }
  expose(:message, attributes: :message_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: MessagesDatatable.new(view_context) }
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    respond_to do |format|
      if message.save
        format.html { redirect_to message, notice: 'Message was successfully created.' }
        format.json { render json: message, status: ':created', location: message }
      else
        format.html { render action: 'new' }
        format.json { render json: message.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    respond_to do |format|
      if message.update(message_params)
        format.html { redirect_to message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: message.errors, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:posted_text, :provider, :nickname, :identity_id, :project_id, :posted_at)
    end
end

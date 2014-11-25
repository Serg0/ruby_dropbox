class FileMessagesController < ApplicationController
  before_action :set_file_message, only: [:show, :edit, :update, :destroy]

  # GET /file_messages
  # GET /file_messages.json
  def index
    @file_messages = FileMessage.all
  end

  # GET /file_messages/1
  # GET /file_messages/1.json
  def show
  end

  # GET /file_messages/new
  def new
    @file_message = FileMessage.new
  end

  # GET /file_messages/1/edit
  def edit
  end

  # POST /file_messages
  # POST /file_messages.json
  def create
    file_message_params.merge!(:recipient_id => params[:recipient_id], :sender_id => current_user.id)
    pp file_message_params
    @file_message = FileMessage.new(file_message_params)

    respond_to do |format|
      if @file_message.save
        flash[:notice] = 'File message was successfully sent.'
        # format.html{redirect_to friends_users_path, notice: 'File message was successfully sent.'}
        # format.json{redirect_to friends_users_path, notice:'File message was successfully sent.'}
        # format.js{redirect_to friends_users_path, notice: 'File message was successfully sent.'}
        format.js
      else
        flash[:alert] = 'File message was NOT sent.'
        # format.html{redirect_to friends_users_path, notice: 'File message was NOT successfully sent.'}
        # format.json{redirect_to friends_users_path, notice: 'File message was NOT successfully sent.'}
        # format.js{redirect_to friends_users_path, notice: 'File message was successfully sent.'}
        format.js
        # redirect_to request.referer, notice: 'File message was  successfully sent.'
      end
    end
  end

  # PATCH/PUT /file_messages/1
  # PATCH/PUT /file_messages/1.json
  def update
    respond_to do |format|
      if @file_message.update(file_message_params)
        format.html { redirect_to @file_message, notice: 'File message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @file_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_messages/1
  # DELETE /file_messages/1.json
  def destroy
    @file_message.destroy
    respond_to do |format|
      format.html { redirect_to file_messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_message
      @file_message = FileMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_message_params
      params.require(:file_message).merge(:recipient_id => params[:recipient_id], :sender_id => current_user.id).permit(:sender_id, :recipient_id, :name, :link, :bytes, :icon, :thumbnailLink, :created_at, :new)
    end
end
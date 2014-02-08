class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy]

    # GET /messages
    # GET /messages.json
    def index
        @messages = Message.where(to_user: current_user)
    end

    # GET /messages/1
    # GET /messages/1.json
    def show
    end

    # POST /messages/new
    def new
        @message = Message.new
        @to_user = User.find(params[:message][:to_user_id])
    end

    # POST /messages
    # POST /messages.json
    def create
        @message = Message.new(message_params)
        @to_user = @message.to_user
        
        if @message.save
            render action: 'sent'
        else
            render action: 'new'
        end
    end

    # PATCH/PUT /messages/1
    # PATCH/PUT /messages/1.json
    def update
        respond_to do |format|
            if @message.update(message_params)
                format.html { redirect_to @message, notice: 'Message was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @message.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /messages/1
    # DELETE /messages/1.json
    def destroy
        @message.destroy
        respond_to do |format|
            format.html { redirect_to messages_url }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_message
            @message = Message.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def message_params
            params.require(:message).permit(:subject, :body, :to_user_id)
        end
end

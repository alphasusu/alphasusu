class MessagesController < ApplicationController
    before_action :set_site_area
    before_filter :require_login

    # GET /messages
    # GET /messages.json
    def index
        @messages = Message.where(to_user: current_user)
    end

    # POST /messages/new
    def new
        @message = Message.new
        @to_user = User.find(params[:message][:to_user_id])
    end

    # POST /messages
    def create
        @message = Message.new(message_params)
        @to_user = @message.to_user

        if @message.save
            RepresentativeMailer.contact_email(@message).deliver
            render action: 'sent'
        else
            render action: 'new'
        end
    end

private

    def message_params
        params.require(:message).permit(:subject, :body, :to_user_id)
    end

    def set_site_area
        params[:site_area] = :help
    end
end

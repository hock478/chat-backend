class MessagesController < ApplicationController
    def index
        messages = Message.all
        render json: messages
    end

    def show
        messages = Message.where(group_id: params[:id])
        render json: messages.as_json(:include => [:user])
    end

    def create
        message = Message.create(group_id: params[:group_id], content: params[:content], user_id: params[:user_id])
        render json: message.as_json(:include => [:user, :group])
    end

end

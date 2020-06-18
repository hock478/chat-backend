class FollowsController < ApplicationController
    def index
        follows = Follow.all
        render json: follows
    end

    def create
        follow = Follow.create(user_id: params[:user_id], following_id: params[:following_id] )
    end

    def delete_fol
        follow = Follow.find_by(user_id: params[:user_id], following_id: params[:following_id])
        follow.destroy
    end


end

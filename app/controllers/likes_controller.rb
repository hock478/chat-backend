class LikesController < ApplicationController

def index
    likes = Like.all
    render json: likes
end


def create
    like = Like.create(user_id: params[:user_id], post_id: params[:post_id])
    render json: like
end

def destroy
    like = Like.find_by(post_id: params[:post_id], user_id: params[:user_id])
    k = like
    like.destroy
    render json: like
end

end
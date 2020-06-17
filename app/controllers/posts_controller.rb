class PostsController < ApplicationController
    def index
        posts = Post.all
        render json: posts
    end

    def show
        user = User.find(parmams[:id])
        posts = user.posts
        render json.as_json(:include => [:user])

    end

    def create
        post = Post.create(user_id: params[:user_id], header: params[:header], content: params[:content])
        render json: group_user
    end

    def following_posts
        user = User.find(params[:id])
        posts_arr = []
        user.following.each{|user| user.posts.each{|post| posts_arr.push(post)} }
        render json: posts_arr.as_json(:include => [:user])
    end
end

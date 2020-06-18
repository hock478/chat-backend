class PostsController < ApplicationController
    def index
        posts = Post.all
        render json: posts
    end

    def show
        user = User.find(parmams[:id])
        posts = user.posts
        render json.as_json(:include => [:user, :likes])

    end

    def create
        post = Post.create(user_id: params[:user_id], header: params[:header], content: params[:content], hash_tags: params[:hash_tags])
        render json: post.as_json(:include => [:user, :likes])
    end

    def following_posts
        user = User.find(params[:id])
        posts_arr = []
        user.posts.each{|p| posts_arr.push(p)}
        user.following.each{|user| user.posts.each{|post| posts_arr.push(post)} }
        posts_arr = posts_arr.sort_by &:created_at
        posts_arr = posts_arr.reverse
        render json: posts_arr.as_json(:include => [:user, :likes])
    end
end

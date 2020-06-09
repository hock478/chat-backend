class GroupsController < ApplicationController

    def index
        groups = Group.all
        render json: groups.as_json(:include => [:users, :user])
    end

    def show
        user = User.find(params[:id])
    
        groups = user.groups
        render json: groups.as_json(:include => [:users, :user, :messages])
    end
    
end

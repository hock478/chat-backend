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

    def create
        group = Group.create(title: params[:title], user_id: params[:user_id])

        arr_group_user = params[:users]
        
        arr_group_user.each{|user| 
        GroupUser.create(user_id: user["id"], group_id: group.id)
    }
        render json: group
    end
    
end

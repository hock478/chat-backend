class GroupUsersController < ApplicationController
    def index
        groupusers = GroupUser.all
        render json: groupusers
    end

    def show

    end

    def create
        group_user = GroupUser.create(user_id: params[:user_id], group_id: params[:group_id])
        render json: group_user
    end
end

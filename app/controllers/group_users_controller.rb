class GroupUsersController < ApplicationController
    def index
        groupusers = GroupUser.all
        render json: groupusers
    end

    def show

    end
end

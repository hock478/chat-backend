class UsersController < ApplicationController

    def index
        users = User.all
        render json: users.as_json(:include => [:following, :followers, :posts])
    end

    def profile
        token = request.headers["Authenticate"]
        user = User.find(decode(token)["user_id"])
        render json: user.as_json(:include => [:following, :followers, :posts])
    end

    def show
        user = User.find(params[:id])
        render json: user.as_json(:include => [:following, :followers, :posts])
    end

    def specific
        user = User.find_by(username: params[:username])
        render json: user.as_json(:include => [:following, :followers, :posts])
    end

    def create
        # user = User.new(users_params)
        user = User.create(users_params)

        if user.profile_pic == nil
            user.update(profile_pic: "https://t3.ftcdn.net/jpg/00/64/67/80/240_F_64678017_zUpiZFjj04cnLri7oADnyMH0XBYyQghG.jpg")
        end

        if user.valid? && user.age != nil && user.age != ""
            user.save
            payload = {user_id: user.id}
            token = encode(payload)
            new_hash = {}
            
            new_hash["user_data"] = user
            new_hash["token"] = token
            render json: new_hash
        else
            er = {}
            er["error_message"] = user.errors
            render json: er
        end


        
    end

    def delete_user
        user = User.find(params[:id])
        user.destroy

    end


    private

    def users_params
        params.require(:user).permit(:fullname, :username, :age, :bio, :profile_pic, :password, :password_confirmation)
    end


end

class Admin::UsersController < AdminController

    def index
        @users = User.includes(:groups).all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to admin_users_path
        else
            render "edit"
        end
    end

    def user_params
        params.require(:user).permit(:email, group_ids: [])
    end
end

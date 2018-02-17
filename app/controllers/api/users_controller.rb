class Api::UsersController < ApiController

    before_action :authenticated?, :set_user   ###???###

    def index
        users = User.all
        render json: users, each_serializer: UserSerializer
    end

    def create
        user = User.new(user_params)
     if user.save
       render json: user
     else
       render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
     end
    end

    def destroy
        begin
          current_user = User.find(params[:id])
          current_user.destroy
          render json: {}, status: :no_content  ##????##
        rescue ActiveRecord::RecordNotFound
         render :json => {}, :status => :not_found
        end
    end
   
 
    private

    def set_user
      current_user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password)
    end

end
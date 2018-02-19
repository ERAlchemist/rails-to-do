class Api::ListsController < ApiController
    before_action :authenticated?#, :set_user , :set_list

    def index
        lists = @user.lists
        render json: lists, each_serializer: ListSerializer
    end

    def create
        list = @user.lists.build(list_params)
        if list.save
            render json: list
        else
            render json: {errors: list.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    def destroy
        begin
           @user = User.find(params[:user_id])
           list = @user.lists.find(params[:id])
           list.destroy
           render json: {}, status: :no_content
        rescue ActiveRecord::RecordNotFound
            render :json => {}, :status => :not_found
        end  
    end

    def update
        list = List.find(params[:id])
        if list.update(list_params)
            render json: list
        else
            render json: {errors: list.errors.full_messages }, status: :unprocessable_entity
        end
    end

   #def set_user
      #@user = User.find(params[:user_id])
   #end

   # def set_list
      #list = @user.lists.find(params[:id])
   # end

    private

    def list_params
        params.require(:list).permit(:title, :private, items_attributes: [:id, :title])
    end
  
end
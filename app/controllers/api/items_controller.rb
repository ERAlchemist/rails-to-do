class Api::ItemsController < ApiController
    before_action :authenticated?, :set_user
  
    def create
        item = current_user.lists.find(params[:list_id]).items.build(item_params)
        if item.save
            render json: item
        else
            render json: {errors: item.errors.full_messages},
            status: :unprocessable_entity
        end
    end

    def set_user
        current_user = User.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:title, :status)
    end
 
end
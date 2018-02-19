class Api::ItemsController < ApiController
    before_action :authenticated? #, :set_user
  
    def create
        current_user = User.find(params[:id])
        item = current_user.lists.find(params[:list_id]).items.build(item_params)
        if item.save
            render json: item
        else
            render json: {errors: item.errors.full_messages},
            status: :unprocessable_entity
        end
    end

    def update
      #  @user = User.find(params[:user_id])
        @item = Item.find(params[:id])
      #  raise unless @item.list.user == @user
        if @item.update(item_params)
            render json: @item
        else
            render json: {errors: @item.errors.full_messages },
            status: :unprocessable_entity
        end
    end

   # def set_user
      #  current_user = User.find(params[:id])
  #  end

    private

    def item_params
        params.require(:item).permit(:title, :status)
    end
 
end
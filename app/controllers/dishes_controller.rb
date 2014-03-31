class DishesController < ApplicationController
  before_action :do_authentication,
                only: USERS_ACTIONS + [ :index, :show ]

  def index
    @dishes = Dish.order 'name ASC'
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new dish_params.merge( user_id: current_user.id )
    if @dish.save
      flash[:notice] = 'Dish created successfully'
      redirect_to action: :index
    else
      acknowledge_errors @dish
      render 'new'
    end
  end

  def show
    @dish = Dish.find params[:id]
  end

  def edit
    @dish = Dish.find params[:id]
  end

  def update
    @dish = Dish.find params[:id]
    if @dish.update_attributes dish_params
      redirect_to action: :show, id: @dish.id
    else
      acknowledge_errors @dish
      render 'edit'
    end
  end

  def destroy
    Dish.find(params[:id]).destroy
    redirect_to action: :index
  end

private
  def dish_params
    params.require(:dish).permit :name, :description, :price, :image
  end
end

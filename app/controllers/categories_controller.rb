class CategoriesController < ApplicationController
  before_action :confirm_logged_in,
                only: USERS_ACTIONS

  def index
    @categories = MenuCategory.order 'name ASC'
  end

  def show_dishes
    @category = MenuCategory.find params[:id]
  end

  def new
    @category = MenuCategory.new
  end

  def create
    @category = MenuCategory.new category_params.merge( user_id: current_user.id )
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to action: :index
    else
      flash[:alerts] = @category.errors.full_messages
      render 'new'
    end
  end

  def add_dish
    @category = MenuCategory.find params[:id]
    @dishes = Dish.all
  end

  def update_dishes
    @category = MenuCategory.find params[:id]
    @dish = Dish.find params[:dish]
    @category.dishes << @dish
  end

  def edit
    @category = MenuCategory.find params[:id]
  end

  def update
    @category = MenuCategory.find params[:id]
    if @category.update_attributes category_params
      redirect_to action: :show_dishes, id: @category.id
    else
      render 'edit'
    end
  end

  def destroy
    MenuCategory.find(params[:id]).destroy
    redirect_to action: :index
  end

private
  def category_params
    params.require(:menu_category).permit :name
  end
end

class CategoriesController < ApplicationController
  before_action :do_authentication,
                only: USERS_ACTIONS + [ :add_dish, :update_dishes, :destroy_dish_assoc ]

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
      redirect_to action: :show_dishes, id: @category.id
    else
      acknowledge_errors @category
      render 'new'
    end
  end

  def add_dish
    @category = MenuCategory.find params[:id]
    @dishes = Dish.all
    @allowed_dishes = []
    @dishes.each do |dish|
      if not @category.dishes.include? dish
        @allowed_dishes << dish
      end
    end
  end

  def update_dishes
    @category = MenuCategory.find params[:id]
    if params[:dish]
      @dish = Dish.find params[:dish]
      @category.dishes << @dish
      flash[:notice] = 'Dish added successfully'
    end
    redirect_to action: :add_dish, id: @category.id
  end

  def edit
    @category = MenuCategory.find params[:id]
  end

  def update
    @category = MenuCategory.find params[:id]
    if @category.update_attributes category_params
      flash[:notice] = 'Category updated successfully'
      redirect_to action: :show_dishes, id: @category.id
    else
      acknowledge_errors @category
      render 'edit'
    end
  end

  def destroy
    MenuCategory.find(params[:id]).destroy
    flash[:notice] = 'Category removed successfully'
    redirect_to action: :index
  end

  def destroy_dish_assoc
    dish = Dish.find params[:dish_id]
    category = MenuCategory.find params[:category_id]

    category.dishes.delete(dish)
    if category.save
      flash[:notice] = 'Dish successfully removed from category'
    else
      acknowledge_errors category
    end

    redirect_to action: :show_dishes, id: category.id
  end

private
  def category_params
    params.require(:menu_category).permit :name
  end
end

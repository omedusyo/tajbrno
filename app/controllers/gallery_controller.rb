class GalleryController < ApplicationController
  before_action :confirm_logged_in,
                only: USERS_ACTIONS

  def index
    @images = GalleryImage.order 'created_at DESC'
  end

  def show
    @image = GalleryImage.find params[:id]
  end

  def new
    @image = GalleryImage.new
  end

  def create
    @image = GalleryImage.new gallery_image_params.merge( user_id: current_user.id )
    if @image.save
      flash[:notice] = 'Gallery image added successfully'
      redirect_to action: :index
    else
      flash[:errors] = @image.errors.full_messages
      render 'new'
    end
  end

  def edit
    @image = GalleryImage.find params[:id]
  end

  def update
    @image = GalleryImage.find params[:id]
    if @image.update_attributes gallery_image_params
      redirect_to action: :show, id: @image.id
    else
      render 'edit'
    end
  end

  def destroy
    GalleryImage.find(params[:id]).destroy
    redirect_to action: :index
  end

private
  def gallery_image_params
    params.require(:gallery_image).permit :image, :alt
  end
end

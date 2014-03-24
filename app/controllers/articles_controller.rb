class ArticlesController < ApplicationController
  before_action :confirm_logged_in,
                only: USERS_ACTIONS

  def index
    @articles = Article.order 'created_at DESC'
  end

  def show
    @article = Article.find params[:id]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params.merge( user_id: current_user.id )
    if @article.save
      flash[:notice] = 'Article created successfully'
      redirect_to action: :index
    else
      flash[:errors] = @article.errors.full_messages
      render 'new'
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update_attributes article_params
      redirect_to action: :show, id: @article.id
    else
      flash[:errors] = @article.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to action: :index
  end

  def contacts
  end

private
  def article_params
    params.require(:article).permit :title, :content
  end
end

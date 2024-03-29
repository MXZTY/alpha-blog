class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end 
  
  def new 
    @article = Article.new
  end 

  def edit 
    #before_action handles this request
  end 

  def create 
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save 
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else 
      render :new
    end 
  end

  def update 
    # render plain: params[:article].inspect
    if @article.update(article_params) 
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else 
      render :edit
    end 
  end 

  def show 
    #before_action handles this request
  end 

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end


  private
    def article_params
      # :article since we need the top level key to permit the values of title and the description
      params.require(:article).permit(:title, :description)
    end 

    def set_article
      @article = Article.find(params[:id])
    end 

    def require_same_user
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = "you can only edit or delete your own articles"
        redirect_to root_path
      end
    end

    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "Only admin users can perform that action"
        redirect_to root_path
      end
    end

end 
class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @allArticles = Article.all
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
    if @article.save 
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else 
      render :new
    end 
  end

  def update 
    if @article.update(article_params) 
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else 
      render = 'edit'
    end 

  end 

  def show 
    #before_action handles this request
  end 

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
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

end 
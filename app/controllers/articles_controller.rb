class ArticlesController < ApplicationController
  def new 
    @article = Article.new
  end 

  def create 
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  private
    def article_params

      # :article since we need the top level key to permit the values of title and the description
      params.require(:article).permit(:title, :description)

    end 

end 
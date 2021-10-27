class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end
   
  def create 
    @article = Article.new(article_params)
    # ---- see details in all_themes.docx 90-91 ----
    # render plain: @article # If we want look at Object 
    # render plain: @article.inspect # If we want look at details 

    if @article.save
      flash[:notice] = "Article was create successfully"
      redirect_to @article
    # redirect_to article_path(@article)    - here work too, just longer
    else
      render 'new'
    end
  end  

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
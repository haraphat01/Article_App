# rubocop:disable Style/GuardClause
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, only: %i[new edit update destroy show index]
  before_action :require_same_author, only: %i[edit update destroy]

  def index
    @articles = Article.most_recent
    @article = Article.new
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = current_user.created_articles.build(article_params)
      if @article.save
        redirect_to @article, notice: 'Article was successfully created.' 
       
      else
        
        render :edit 
      end
    
  end

  def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
        
      else
        render :edit 
        
      end
    
  end

  def destroy
    if @article.destroy
     
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    else
     redirect_to articles_url, notice: "error: #{@article.errors.full_messages}"
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end

  def require_same_author
    if current_user != @article.author and !current_user.admin?
       redirect_to articles_url, notice: 'You can only edit your own Article!!'
    end
  end
end
# rubocop:enable Style/GuardClause

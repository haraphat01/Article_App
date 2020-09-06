class ArticlesController < ApplicationController
  class ArticlesController < ApplicationController
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
      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: 'Article was successfully created.' }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      if @article.destroy
        respond_to do |format|
          format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to articles_url, notice: "error: #{@article.errors.full_messages}" }
        end
      end
    end
  
    private
  
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :content, :image, category_ids: [])
    end
  
    def require_same_author
      if current_user != @article.author and !current_user.admin?
        respond_to do |format|
          format.html { redirect_to articles_url, notice: 'You can only edit your own Article!!' }
        end
      end
    end
  end
  
end
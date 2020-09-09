# rubocop:disable Style/GuardClause
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :require_user, only: %i[new edit update destroy show index]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @categories = Category.includes([:articles]).most_important
    @famous_article = Article.most_famous
    @articles = Article.any?
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_url, notice: 'Category was successfully destroyed.'
    else
      redirect_to categories_url, notice: "error: #{@category.errors.full_messages}"
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def require_same_user
    if current_user != @category.user and !current_user.admin?
      redirect_to categories_url, notice: 'You can only edit your own categories'
    end
  end
end
# rubocop:enable Style/GuardClause

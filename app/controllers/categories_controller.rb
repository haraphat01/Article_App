class CategoriesController < ApplicationController
    def index
        @categories = Category.all
        @liked_article = Article.highest_vote.first
      end
    
      def new
        @category = Category.new
      end
end

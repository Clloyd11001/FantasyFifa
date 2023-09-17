class ApplicationController < ActionController::Base
    def index
      @articles = Article.all
      @brackets = Bracket.all
    end
  
    def show
      @article = Article.find(params[:id])
      @bracket = Bracket.find(params[:id])

    end
  
    def new
      @article = Article.new
      @bracket = BracketTree
    end
  
    # def create
    #   # @article = Article.new(article_params)
    #   # @bracket = BracketTree.new(bracket_params)
  
    #   if @article.save
    #     redirect_to @bracket
    #   else
    #     render :new, status: :unprocessable_entity
    #   end
    # end
  
    private
      def article_params
        params.require(:article).permit(:title, :body)
      end
      def bracket_params
        params.require(:bracket).permit(:player, :position)
      end
      
      
end
  
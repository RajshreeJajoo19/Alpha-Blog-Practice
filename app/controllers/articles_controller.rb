class ArticlesController < ApplicationController

    def show
        #debugger
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Article was created successfully"
             redirect_to (@article)
        else 
            redirect_to new_article_path, alert: @article.errors.full_messages.join(', ')

            #render 'new'
        end 
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated successfully"
        else 
            redirect_to new_article_path, alert: @article.errors.full_messages.join(', ')

            #render 'edit'
        end 
    end 

    def destroy 
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end 
end

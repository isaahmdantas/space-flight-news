class ArticlesController < ApplicationController 
    before_action :set_article, only: [:show, :update, :destroy]

    # GET /articles 
    def index 
        page = params.try(:[], :page) || 1
        per_page = params.try(:[], :per_page) || 10

        @articles = Article.page(page).per(per_page)

        render json: @articles, status: :ok 
    end

    # GET /articles/:id 
    def show
        render json: @article, status: :ok
    end 


    # POST /articles 
    def create 
        @article = Article.new(article_params)
        if @article.save 
            render json: @article, status: :created 
        else
            render json: @article.errors.full_messages, status: :unprocessable_entity 
        end
    end

    # PATCH/PUT /articles/:id 
    def update 
        if @article.update(article_params) 
            render json: @article, status: :created 
        else
            render json: @article.errors.full_messages, status: :unprocessable_entity 
        end
    end

    # DELETE /articles/:id 
    def destroy 
        if @article.destroy 
            head :no_content
        else 
            render json: @article.errors.full_messages, status: :unprocessable_entity 
        end
    end

    private 
        def set_article 
            @article = Article.find_by_id(params.try(:[], :id))
        end

        def article_params
            unless params[:article].blank?
                params.require(:article).permit(
                    :featured,
                    :title,
                    :url,
                    :imageUrl,
                    :newSite,
                    :summary,
                    :publishedAt,
                    event_ids: [],
                    launch_ids: []
                )
            end
        end

end
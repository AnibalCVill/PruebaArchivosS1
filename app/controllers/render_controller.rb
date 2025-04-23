class RenderController < ApplicationController
  def index
    # Acá van las pestañas permitidas en forma de hash!
    views = {
      "main" => "main_page_form",
      "login" => "login_form",
      "article" => "article_form",
      "blog" => "blog_form",
      "search" => "search_form",
      "create_article" => "create_article_form",
      "create_blog" => "create_blog_form",
    }

    # El caso inicial tiene que iniciar la página en el inicio
    view = views[params[:view]] || "main_page_form"

    case view
    when "search_form"
      @search_parameter = params[:query]
      @search_for = params[:search_for] || "articles" 
    
      if @search_for == "articles"
        if params[:by] == "id"
          @results = [Article.find_by(id: @search_parameter)]
        else
          @results = Article.where("title ILIKE ?", "%#{@search_parameter}%").order(updated_at: :desc)
        end
      else
        if params[:by] == "id"
          @results = [Blog.find_by(id: @search_parameter)]
        else
          @results = Blog.where("title ILIKE ?", "%#{@search_parameter}%").order(updated_at: :desc)
        end
      end
    
    when "article_form"
      article_id = params[:query]
      @article = Article.find(article_id)
    
    when "blog_form"
      blog_id = params[:query]
      @blog = Blog.find(blog_id)

    when "create_blog_form"
      article_id = params[:article_id]
      @article = Article.find(article_id)
    end
    # DEFAULT RESPONSE!
    begin
      render view
    rescue ActionView::MissingTemplate
      render "main_page_form"
    end
  end
end


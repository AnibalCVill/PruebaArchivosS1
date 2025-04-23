class ArticlesController < ApplicationController
  # POST /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:created] = true
      redirect_to root_path
    else
      render "render/index", status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:article_id])

    if @article.update(article_params)
      redirect_to root_path(view: "article", query: @article.id), notice: "Artículo actualizado"

    else
      render "render/index", locals: { view: "article", query: @article.id }, status: :unprocessable_entity
    end
  end


  def article_params
    params.require(:article).permit(:title, :description, :info_type, 
    :references);
  end

end
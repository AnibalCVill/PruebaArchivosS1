class BlogsController < ApplicationController
  # POST /articles
  def create
    @blog = Blog.new(blog_params);
    if @blog.save
      redirect_to root_path, notice: "Blog creado correctamente"
    else
      render "render/index", locals: { view: "create_blog_form", article_id: @blog.article_id }, status: :unprocessable_entity
    end
  end

  def update
    @blog = Blog.find(params[:blog_id])

    if @blog.update(blog_params)
      redirect_to root_path(view: "blog", query: @blog.id), notice: "Artículo actualizado"

    else
      render "render/index", locals: { view: "blog", query: @blog.id }, status: :unprocessable_entity
    end
  end

  def delete
    if Blog.exists?
      @blog = Blog.find(params[:blog_id])
      @blog.destroy
      redirect_to root_path, notice: "Blog eliminado correctamente"
    else
      render "render/index", locals: { view: "blog_form", query: params[:blog_id] }, status: :unprocessable_entity
    end
  end

  def blog_params
    params.require(:blog).permit(:title, :description, :editors, :info_type, 
    :related_info, :article_id);
  end

end
class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    @blogs_all = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:review,:device_image,:category_id,:rating)
  end
end

class BlogsController < ApplicationController
  impressionist :actions => [:show], :unique => [:impressionable_id, :ip_address]

  def index
    @blogs = Blog.order(created_at: :desc)
    @category
  end

  def show
    @blog = Blog.find(params[:id])
    @views = @blog.impressions.size #PV数を取得
  end

  def pv_ranking
    @pv_ranking = Blog.order(impressions_count: 'DESC')
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:review,:device_image,:category_id,:evaluation)
  end
end

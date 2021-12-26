class BlogsController < ApplicationController
  impressionist :actions => [:show], :unique => [:impressionable_id, :ip_address]

  def index
    @blogs = Blog.all
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
    params.require(:blog).permit(:title,:review,:device_image,:category_id,:rating)
  end
end

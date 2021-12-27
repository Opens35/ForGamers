class Admin::BlogsController < ApplicationController
  before_action :authenticate_admin!
  # 記事の一覧表示
  def index
    @blogs = Blog.all.page(params[:page])
  end

  # 記事の表示
  def show
    @blog = Blog.find(params[:id])
  end

  # 記事の作成
  def new
    @blog =Blog.new
  end

    # 記事の登録
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to admin_blog_path(@blog)
    else
      render :new
    end
  end

    # 記事の編集
  def edit
    @blog = Blog.find(params[:id])
  end

    # 記事の更新
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      flash[:success] = "レビュー内容を変更しました"
      redirect_to admin_blog_path(@blog)
    else
      render :edit
    end
  end

    # 記事の削除
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admin_blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title,:review,:device_image,:category_id,:evaluation)
  end
end

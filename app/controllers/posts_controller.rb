class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    post = Post.new(post_params)
    post.save!
    #!は例外を発生させ、その後の処理に繋げられる（例外処理）。！をつけなければnilが返される。
    redirect_to posts_url, notice: "「#{post.title}」が投稿されました。"
  end
  
  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path, notice: "「#{post.title}」の内容が更新されました。"
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice:"「#{post.title}」は削除されました。"
  end
  
  def post_params
    params.require(:post).permit(:title, :content)
    # 許可した(permit)カラム型を要求した(require)モデルから引き出す(params)。選定作業。
    # StrongParameters(セキュリティー強化)
  end
end

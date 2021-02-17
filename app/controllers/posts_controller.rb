class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
  end

  def checked
    post = Post.find(params[:id])
    if post.checked 
      # このcheckedは、postsテーブルのカラムcheckedの値を取り出しているという認識でOKか？だとすると、テーブルのcheckedのカラムデータはいつ作られているのか？
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end

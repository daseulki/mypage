class HomeController < ApplicationController
  def index
  end
#회원가입
  def new

  end

  def create
  end

  #게시판
  def postall
    @post = Post.all
  end
#ㄱㅔ시글 쓰기
  def postnew
  end

  def postcreate
    post = Post.new
    post.name = params[:name]
    post.title = params[:title]
    post.content = params[:content]
    post.save
    redirect_to "/home/postshow/#{post.id}"
  end

  #게시글 보임
  def postshow
    @post = Post.find(params[:id])
    @comments = Comment.all

  end
  def add_comment
    @post = Post.find(params[:id])
    comment = Comment.new
    comment.content = params[:content]
    comment.post_id = params[:id]
    comment.save
    redirect_to "/home/postshow/#{comment.post_id}"
  end

# 내 동영상
  def show
  end

  def cute
  end


  def edit
  end

  def update
  end

  def destroy
  end
end

class UserController < ApplicationController
  def index
    @user = User.all
  end

  def new

  end

  def create
    user=User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.save
    @user=User.last
  end

  def login
  end

  def login_process

    #메일주소가 DB에 없으면 ->없는 아이디다  -> 회원가입해라
    @user = User.find_by(email: params[:email])
    @pwd = User.find_by(password: params[:password])
    @msg=""

    if @user.nil?
      flash[:alert] = "   이메일 없는뎅?? 다시 확인해봐! 없으면 회원가입 ㄱㄱ "
      redirect_to :back


    #DB에 있는데 비밀번호가 틀리면 -> 다시 생각해봐
    else
      if @pwd.nil?
        flash[:alert] = "   비밀번호 틀렸어 바보야"
        redirect_to :back

    #다맞으면 로그인 시켜야지
      else
        flash[:notice] = "   #{@user.name} 환영환영!"
        redirect_to '/'

      end
    end
  end

  def logout
    session.clear
    flash[:notice] = "   로그아웃. 성공적."
    redirect_to '/'
  end
end

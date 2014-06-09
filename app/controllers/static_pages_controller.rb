class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if signed_in?
    @microposts = Micropost.paginate(page: params[:page], per_page: 30)
  end

  def help
  end

  def about
  end

  def contact
  end

  def following
    @microposts = current_user.feed.paginate(page: params[:page])
  end

end


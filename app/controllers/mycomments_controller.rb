class MycommentsController < ApplicationController
  
  def new
    @mycomment = Mycomment.new
  end

  def create
    @mycomment = Mycomment.create(params[:mycomment])
    @mycomment.user_id = @auth.id
    binding.pry

    if @mycomment.save
      redirect_to root_path
    else
      render :new
    end
  end

end

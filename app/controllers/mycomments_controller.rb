class MycommentsController < ApplicationController
  
  def new
    @mycomment = Mycomment.new
  end

  def create
    @mycomment = Mycomment.create(params[:mycomment])
    @mycomment.user_id = @auth.id
    @mycomment.text = params["text"]
    @mycomment.company_id = params["company_id"]
    @mycomment.save
   

    if @mycomment.save
      redirect_to company_path(params[:company_id])
    else
      render :new
    end
  end

end

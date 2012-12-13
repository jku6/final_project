class RaterController < ApplicationController 
  
  def create                                  
    if @auth.present?
      obj = eval "#{params[:klass]}.find(#{params[:id]})"     
      if params[:dimension].present?
        obj.rate params[:score].to_i, @auth.id, "#{params[:dimension]}"       
      else
        obj.rate params[:score].to_i, @auth.id 
      end
      
      render :json => true 
    else
      render :json => false        
    end
  end                                        
  
  
end
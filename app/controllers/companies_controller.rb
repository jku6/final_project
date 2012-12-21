class CompaniesController < ApplicationController
    autocomplete :company, :name, :full => true, :extra_data => [:address]

    def index
      @companies = Company.page(params[:page])
    end

    def map
      @companies = Company.all
    end
  
    def create

      #   # This is the added code
      #   place = Geocoder.search(params[:vacation][:name])
      #   lat = place[0].latitude
      #   long = place[0].longitude
      #   addr = place[0].address

      if Company.all.empty?

        y = HTTParty.get('http://data.cityofnewyork.us/api/views/f4yq-wry5/rows.json')
        z = y["data"].length
        
        z.times do |a|
          @address = y["data"][a][9]
          #place = Geocoder.search(@address + " New York, NY")
          @name = y["data"][a][8]
         # @lat = place[0].data["geometry"]["location"]["lat"]
         # @long = place[0].data["geometry"]["location"]["lng"]
          @address2 = y["data"][a][10]
          @category = y["data"][a][12]
          @url = y["data"][a][13][0]
          @hiring = y["data"][a][14]
          
          @company = Company.create(name: @name, address: @address, address2: @address2, category: @category, url: @url, hiring: @hiring)

        end
      end
        @companies = Company.all
    end


    def search
      
      query = params[:query]
      if query.present?
        @companies = Company.text_search(query)
      else
        @companies = Company.all
      end
    end

    def search2
      
      query = params[:query]
      if query.present?
        @companies = Company.text_search(query)
      else
        @companies = Company.all
      end
    end

    def show
      @company = Company.find(params[:id])
      # @user = User.find(params[:id])

      # @rate = Rate.all

      # @r = Rate.where(:rateable_id => @company.id, :dimension => "overall_satisfaction")
      # @value = @r.first.stars

      @x = Mycomment.where(:company_id => params[:id])
      @pager = @x.page(params[:page])
      commentnum = @x.length
      commentnum.times do |a|
      @y = User.find(@x[a]['user_id']) 
      end    
    end
end
class CompaniesController < ApplicationController

    def index
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
        place = Geocoder.search(@address + " New York, NY")
        @name = y["data"][a][8]
        @lat = place[0].data["geometry"]["location"]["lat"]
        @long = place[0].data["geometry"]["location"]["lng"]
        @address2 = y["data"][a][10]
        @category = y["data"][a][12]
        @url = y["data"][a][13][0]
        @hiring = y["data"][a][14]
        


        @company = Company.create(name: @name, lat: @lat, long: @long, address: @address, address2: @address2, category: @category, url: @url, hiring: @hiring)

      end
    end
      @companies = Company.all


    end
end
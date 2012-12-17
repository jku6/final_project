# if Company.all.empty?
#   y = HTTParty.get('http://data.cityofnewyork.us/api/views/f4yq-wry5/rows.json')
#   z = y["data"].length
#       z.times do |a|
#         address = y["data"][a][9]
#             #place = Geocoder.search(@address + " New York, NY")
#         name = y["data"][a][8]
#            # @lat = place[0].data["geometry"]["location"]["lat"]
#            # @long = place[0].data["geometry"]["location"]["lng"]
#         address2 = y["data"][a][10]
#         category = y["data"][a][12]
#         url = y["data"][a][13][0]
#         hiring = y["data"][a][14]
        
#         company = Company.create(name: name, address: address, address2: address2, category: category, url: url, hiring: hiring)
#       end
# end

30.times do
  Company.all.each do |company|
    # puts company.address
    begin
      place = Geocoder.search(company.address + " New York, NY ")  
      company.lat = place[0].data["geometry"]["location"]["lat"]
      company.long = place[0].data["geometry"]["location"]["lng"]
      company.save
    rescue
    end
  end
end
  

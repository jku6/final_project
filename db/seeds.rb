Company.all.each do |company|
  puts company.address
  begin
    place = Geocoder.search(company.address + " New York, NY ")  
    company.lat = place[0].data["geometry"]["location"]["lat"]
    company.long = place[0].data["geometry"]["location"]["lng"]
    company.save
  rescue
  end
end

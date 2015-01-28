Vendor.all.each do |vendor|
  vendor.scrape_crunchbase
  vendor.save
end

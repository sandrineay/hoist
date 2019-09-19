require 'open-uri'
require 'nokogiri'

# Creating listing profiles

puts 'Scraping catamarans'

for number in 1..2
  puts "Scraping page #{number}"
  url = "https://www.boats.com/boats-for-sale/?activity=sailing&length=&price=&boat-type=sail&class=sail-catamaran&page=#{number}"
  html_doc = Nokogiri::HTML(open(url).read)
  urls = html_doc.search('#listings-srp a[data-reporting-click-listing-type]').map{ |url| 'https://www.boats.com' + url.attribute('href').value }

  urls.each do |url|
    html_doc = Nokogiri::HTML(open(url).read)
    data = {}

    price = html_doc.search('span.price').text
    data['currency'] = price.split(/\d/).first
    data['ask_price'] = price.chars.select{|char| char =~ /\d/}.join.to_i


    listing = Listing.create(
      website: 'https://www.boats.com',
      website_uid: url.split('-').last.delete_suffix('/').to_i,
      url: url
    )

    listing_price = ListingPrice.create(
      listing: listing,
      ask_price: data['ask_price'],
      currency: data['currency']
    )

    puts "#{listing}"

    # t.string "hull_material"
    # t.string "rigging_type"
    # t.string "ballast_type"
    # t.string "keel_type"
    # t.string "windlass_type"
    # t.string "certification"
    # t.string "builder"
    # t.string "designer"
    # t.string "boat_type"
    # t.string "boat_class"
    # t.integer "cabins"
    # t.integer "double_berths"
    # t.integer "heads"
    # t.float "length_on_deck"
    # t.float "loa"
    # t.float "lwl"
    # t.float "beam"
    # t.float "sail_area"
    # t.float "max_draft"
    # t.float "min_draft"
    # t.float "displacement"
    # t.float "ballast"
    # t.float "comfort_ratio"
    # t.float "cabin_headroom"
    # t.float "dry_weight"
    # t.float "max_bridge_clearance"
    # t.float "rig_i"
    # t.float "rig_j"
    # t.float "rig_p"
    # t.float "rig_e"
    # t.float "rig_spl_tps"
    # t.float "rig_isp"
    # t.string "fuel_type"
    # t.string "engine_make"
    # t.string "engine_model"
    # t.integer "horse_power"
    # t.string "engine_type"
    # t.string "drive_type"
    # t.string "propeller_type"
    # t.string "propeller_material"
    # t.integer "engine_hours"
    # t.integer "engine_year"
    # t.boolean "folding_propeller"
    # t.float "holding_tank_capacity"
    # t.integer "holding_tank_number"
    # t.string "holding_tank_material"
    # t.float "water_tank_capacity"
    # t.integer "water_tank_number"
    # t.string "water_tank_material"
    # t.float "fuel_tank_capacity"
    # t.integer "fuel_tank_number"
    # t.string "fuel_tank_material"
    # t.float "sa_disp"
    # t.float "bal_disp"
    # t.float "disp_len"
    # t.integer "first_built"
    # t.integer "last_built"
    # t.integer "number_built"
    # t.string "location"
    # t.string "seller"
    # t.string "condition"
    # t.string "tax_status"
    # t.integer "year"
  end
end

# Creating sailboat profiles

# for number in 1..79
#   puts "Scraping page #{number}"
#   url = "https://sailboatdata.com/?paginate=100&page=#{number}"
#   html_doc = Nokogiri::HTML(open(url).read)
#   urls = html_doc.search('#content table a').map{|url| url.attribute('href').value + "?units=metric"}

#   urls.each do |url|
#     html_doc = Nokogiri::HTML(open(url).read)
#     data = {}

#     # Scrape specs
#     specs = html_doc.search('.sailboat-details .sailboatdata-data').map{ |spec| spec.text.gsub("\n", "").strip }
#     labels = html_doc.search('.sailboat-details .sailboatdata-label').map{ |label| label.text.gsub("\n", "").strip[0..-2].parameterize}
#     labels.each_with_index do |label, index|
#       data[label] = specs[index]
#     end

#     boat_model = html_doc.search('#content h1')[1].text
#     data["model"] = boat_model.include?('(') ? boat_model.slice(0...(boat_model.index('('))).strip.downcase : boat_model

#     boat = BoatProfile.create(
#       make: data["builder"],
#       model: data["model"],
#       hull_type: data["hull-type"],
#       rigging_type: data["rigging-type"],
#       loa: data["loa"]&.to_f,
#       lwl: data["lwl"]&.to_f,
#       beam: data["beam"]&.to_f,
#       sail_area: data["s-a-reported"]&.to_f,
#       max_draft: data["draft-max"]&.to_f,
#       min_draft: data["draft-min"]&.empty? ? nil : data["draft-min"]&.to_f,
#       displacement: data["displacement"]&.delete(',').to_f,
#       ballast: data["ballast"]&.empty? ? nil : data["ballast"]&.delete(',').to_f,
#       sa_disp: data["s-a-disp"]&.to_f,
#       bal_disp: data["bal-disp"]&.empty? ? nil : data["bal-disp"]&.to_f,
#       disp_len: data["disp-len"]&.to_f,
#       ballast_type: data["ballast-type"],
#       first_built: data["first-built"]&.to_i,
#       last_built: data["last_built"]&.empty? ? nil : data["last_built"]&.to_i,
#       number_built: data["built"]&.to_i,
#       builder: data["builder"],
#       designer: data["designer"],
#       engine_type: data["type"],
#       horse_power: data["hp"]&.to_i,
#       water_tank_capacity: data["water"]&.to_f,
#       fuel_tank_capacity: data["fuel"]&.to_f,
#       comfort_ratio: data["comfort-ratio"]&.to_f,
#       rig_i: data["i"]&.to_f,
#       rig_j: data["j"]&.to_f,
#       rig_p: data["p"]&.to_f,
#       rig_e: data["e"]&.to_f,
#       rig_spl_tps: data["spl-tps"]&.empty? ? nil : data["spl-tps"]&.to_f,
#       rig_isp: data["isp"]&.empty? ? nil : data["isp"]&.to_f
#       )
#     puts "Created one more boat profile: #{boat.model}"
#   end
#   puts "Done scraping page #{number}. Created #{BoatProfile.count} boat profiles so far!"
# end


# puts "HOORAY! Created #{BoatProfile.count} boat profiles!"

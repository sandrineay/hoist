require 'open-uri'
require 'nokogiri'

# Creating sailboat profiles

for number in 1..79
  puts "Scraping page #{number}"
  url = "https://sailboatdata.com/?paginate=100&page=#{number}"
  html_doc = Nokogiri::HTML(open(url).read)
  urls = html_doc.search('#content table a').map{|url| url.attribute('href').value + "?units=metric"}

  urls.each do |url|
    html_doc = Nokogiri::HTML(open(url).read)
    data = {}

    # Scrape specs
    specs = html_doc.search('.sailboat-details .sailboatdata-data').map{ |spec| spec.text.gsub("\n", "").strip }
    labels = html_doc.search('.sailboat-details .sailboatdata-label').map{ |label| label.text.gsub("\n", "").strip[0..-2].parameterize}
    labels.each_with_index do |label, index|
      data[label] = specs[index]
    end

    boat_model = html_doc.search('#content h1')[1].text
    data["model"] = boat_model.include?('(') ? boat_model.slice(0...(boat_model.index('('))).strip.downcase : boat_model

    boat = BoatProfile.create(
      make: data["builder"],
      model: data["model"],
      hull_type: data["hull-type"],
      rigging_type: data["rigging-type"],
      loa: data["loa"]&.to_f,
      lwl: data["lwl"]&.to_f,
      beam: data["beam"]&.to_f,
      sail_area: data["s-a-reported"]&.to_f,
      max_draft: data["draft-max"]&.to_f,
      min_draft: data["draft-min"]&.empty? ? nil : data["draft-min"]&.to_f,
      displacement: data["displacement"]&.delete(',').to_f,
      ballast: data["ballast"]&.empty? ? nil : data["ballast"]&.delete(',').to_f,
      sa_disp: data["s-a-disp"]&.to_f,
      bal_disp: data["bal-disp"]&.empty? ? nil : data["bal-disp"]&.to_f,
      disp_len: data["disp-len"]&.to_f,
      ballast_type: data["ballast-type"],
      first_built: data["first-built"]&.to_i,
      last_built: data["last_built"]&.empty? ? nil : data["last_built"]&.to_i,
      number_built: data["built"]&.to_i,
      builder: data["builder"],
      designer: data["designer"],
      engine_type: data["type"],
      horse_power: data["hp"]&.to_i,
      water_tank_capacity: data["water"]&.to_f,
      fuel_tank_capacity: data["fuel"]&.to_f,
      comfort_ratio: data["comfort-ratio"]&.to_f,
      rig_i: data["i"]&.to_f,
      rig_j: data["j"]&.to_f,
      rig_p: data["p"]&.to_f,
      rig_e: data["e"]&.to_f,
      rig_spl_tps: data["spl-tps"]&.empty? ? nil : data["spl-tps"]&.to_f,
      rig_isp: data["isp"]&.empty? ? nil : data["isp"]&.to_f
      )
    puts "Created one more boat profile: #{boat.model}"
  end
  puts "Done scraping page #{number}. Created #{BoatProfile.count} boat profiles so far!"
end


puts "HOORAY! Created #{BoatProfile.count} boat profiles!"

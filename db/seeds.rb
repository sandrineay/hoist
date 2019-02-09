require 'open-uri'
require 'nokogiri'

# Creating sailboat profiles

# for number in 1..79
#   puts "Scraping page #{number}"
#   url = "https://sailboatdata.com/?paginate=100&page=#{number}"
#   html_doc = Nokogiri::HTML(open(url).read)
#   urls = html_doc.search('#content table a').map{|url| link.attribute('href').value + "?units=metric"}

#   urls.each do |url|
#     html_doc = Nokogiri::HTML(open(url).read)
#   end
# end

url = "https://sailboatdata.com/sailboat/sun-odyssey-26-jeanneau?units=metric"
html_doc = Nokogiri::HTML(open(url).read)
data = {}

# Scrape specs
specs = html_doc.search('.sailboat-details .sailboatdata-data').map{ |spec| spec.text.gsub("\n", "").strip }
labels = html_doc.search('.sailboat-details .sailboatdata-label').map{ |label| label.text.gsub("\n", "").strip[0..-2].parameterize}
labels.each_with_index do |label, index|
  data[label] = specs[index]
end

BoatProfile.create(
  hull_type: data["hull_type"],
  rigging_type: data["rigging_type"],
  loa: data["loa"],
  lwl: data["lwl"],
  beam: data["beam"]
  )

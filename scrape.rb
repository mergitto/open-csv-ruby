require 'nokogiri'
require 'open-uri'

url = "https://www.acis.famic.go.jp/ddata/index2.htm"
charset = "utf-8"

doc = Nokogiri::HTML(open(url), nil, charset)
doc.xpath('//a').each do |node|
  next if node.attribute('href').nil?
  next unless node.attribute('href').value.include?("zip")
  p node.attribute('href').value
end



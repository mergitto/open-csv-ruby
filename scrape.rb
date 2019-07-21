require 'nokogiri'
require 'open-uri'

url = "https://www.acis.famic.go.jp/ddata/index2.htm"
charset = "utf-8"

doc = Nokogiri::HTML(open(url), nil, charset)
doc.xpath('//div[@id="mainArea"]').each do |main_node|
  main_node.xpath('.//a').each do |node|
    next if node.attribute('href').nil?
    next unless node.attribute('href').value.include?("zip")
    p "#{node.inner_text} : #{node.attribute('href').value}"
  end
end



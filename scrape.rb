require 'nokogiri'
require 'open-uri'

url = "https://www.acis.famic.go.jp/ddata/index2.htm"
famic_data_url = 'https://www.acis.famic.go.jp/ddata/'
charset = "utf-8"

doc = Nokogiri::HTML(open(url), nil, charset)
doc.xpath('//div[@id="mainArea"]').each do |main_node|
  main_node.xpath('.//a').each do |node|
    next if node.attribute('href').nil?
    next unless node.attribute('href').value.include?("zip")
    p "#{URI.join(famic_data_url, node.attribute('href').value).to_s}"
    if node.inner_text.include?('登録基本')
      p "basic: #{node.inner_text} : #{node.attribute('href').value}"
    elsif node.inner_text.include?('登録適用')
      p "description: #{node.inner_text} : #{node.attribute('href').value}"
    end
  end
end



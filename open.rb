require 'open-uri'
require 'rubygems'
require 'zip'

# https://www.acis.famic.go.jp/ddata/index2.htm

def uncompress_file(link_name, output_file_name)
  zip_file = open(URI.escape(link_name))
  Zip::File.open_buffer(zip_file.read) do |zf|
    zf.each do |entry|
      buffer = entry.get_input_stream.read # ファイルの中身
      File.write(output_file_name, buffer)
    end
  end
end

uncompress_file(
  "https://www.acis.famic.go.jp/ddata/datacsv/R0107100.zip",
  "tourokukihon.csv"
)

uncompress_file(
  "https://www.acis.famic.go.jp/ddata/datacsv/R0107101.zip",
  "tourokutekiyou-1.csv"
)

uncompress_file(
  "https://www.acis.famic.go.jp/ddata/datacsv/R0107102.zip",
  "tourokutekiyou-2.csv"
)




require 'open-uri'
require 'rubygems'
require 'zip'
require 'tempfile'
require 'CSV'

# https://www.acis.famic.go.jp/ddata/index2.htm
famic_data_url = 'https://www.acis.famic.go.jp/ddata/'

def uncompress_file(link_name, output_file_name)
  zip_file = open(URI.escape(link_name))
  Zip::File.open_buffer(zip_file.read) do |zf|
    zf.each do |entry|
      buffer = entry.get_input_stream.read # ファイルの中身

      tmp = Tempfile.new
      begin
        File.write(tmp, buffer)
        CSV.read(tmp, headers: true, encoding: 'CP932:UTF-8').each do |row|
          begin
            p row['農薬の種類']
          rescue => error
            puts error
          end
        end
      ensure
        tmp.close
        tmp.delete
      end
    end
  end
end

uncompress_file(
  "https://www.acis.famic.go.jp/ddata/datacsv/R0109010.zip",
  "tourokukihon.csv"
)

#uncompress_file(
#  "https://www.acis.famic.go.jp/ddata/datacsv/R0107101.zip",
#  "tourokutekiyou-1.csv"
#)
#
#uncompress_file(
#  "https://www.acis.famic.go.jp/ddata/datacsv/R0107102.zip",
#  "tourokutekiyou-2.csv"
#)



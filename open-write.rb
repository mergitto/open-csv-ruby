require 'open-uri'
require 'rubygems'
require 'zip'
require 'tempfile'
require 'CSV'

# https://www.acis.famic.go.jp/ddata/index2.htm
famic_data_url = 'https://www.acis.famic.go.jp/ddata/'

def unzip_to_tmp_file(zip_path_url)
zip_file = open(zip_path_url)
  tmp = Tempfile.new
  Zip::File.open_buffer(zip_file.read) do |zf|
    zf.each do |entry|
      buffer = entry.get_input_stream.read

      File.write(tmp, buffer)
      return tmp
    end
  end
end

def uncompress_file(link_name)
  tmp = unzip_to_tmp_file(link_name)
  p tmp.path
  begin
    CSV.open(tmp, headers: true, encoding: 'CP932:UTF-8').each do |row|
      p row['登録番号'], row['農薬の種類']
    end
  ensure
    tmp.close
    tmp.delete
  end
end

uncompress_file("https://www.acis.famic.go.jp/ddata/datacsv/R0109010.zip")
# uncompress_file("https://www.acis.famic.go.jp/ddata/datacsv/r0107101.zip")
# uncompress_file("https://www.acis.famic.go.jp/ddata/datacsv/r0107102.zip")

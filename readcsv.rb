require 'csv'
CSV.foreach("./tourokukihon.csv", encoding: "CP932:UTF-8") do |row|
  begin
    p row
  rescue => error
    puts error
  end
end




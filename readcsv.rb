require 'csv'
CSV.read("./tourokukihon.csv", headers: true, encoding: "CP932:UTF-8").each do |row|
  begin
    p row['農薬の種類']
  rescue => error
    puts error
  end
end

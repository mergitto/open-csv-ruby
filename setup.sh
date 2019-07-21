echo "start save csvfile"
ruby open-write.rb
echo "end save csvfile"

echo "start scraping"
ruby scrape.rb
echo "end scraping"

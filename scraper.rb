require 'rubygems'
require 'scrubyt'

HASH_KEYWORD = "leadscon"

data = Scrubyt::Extractor.define do
	fetch 'http://www.hashtweeps.com/'
	fill_textfield "term", HASH_KEYWORD
	submit

	item "//li[@class='result']" do
		msg "//div[@class='msg']"
		link "//div[@class='info']/a[1]/@href"
		user "//div[@class='info']/a[1]", :generalize => false do
			page_detail do
				profile_info '//ul[@class="about vcard entry-author"]' do
					full_name "//li//span[@class='fn']"
					location "//li//span[@class='adr']"
					website "//li//a[@class='url']/@href"
					bio "//li//span[@class='bio']"
				end
			end
		end
	end
end

dump = File.new("output.xml", "w")
dump.puts data.to_xml

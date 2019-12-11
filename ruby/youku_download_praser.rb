#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('https://v.youku.com/v_show/id_XMzY4NzI1Nzg2NA==.html?spm=a2h0j.11185381.listitem_page1.5!2~A'))

#Wrong
# puts "### Search for nodes by xpath"
#  doc.xpath('//*[@id="listitem_page1"]', '//div/a').each do |link|
#   puts link.attr("href")
# end


#Correct
doc.xpath('//*[@id="listitem_page1"]//div//a').each do |link|
  puts link.attr("href") unless link.nil?
end


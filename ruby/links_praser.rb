#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('https://www.66e.cc/dsj4/20190929/39917.htm'))

# puts "### Search for nodes by xpath"
#  doc.xpath('//*[@id="listitem_page1"]', '//div/a').each do |link|
#   puts link.attr("href")
# end

# puts "### Search for nodes by xpath"
puts doc.xpath('//*[@id="text"]')
 # , '//# a').each do |link|
#   puts link.attr("href")
# end
doc = Nokogiri::HTML(open('https://nokogiri.org/tutorials/installing_nokogiri.html'))

puts "### Search for nodes by css"
doc.css('nav ul.menu li a', 'article h2').each do |link|
  puts link.content
end
#text > table:nth-child(8) > tbody > tr:nth-child(3) > td > a
  # doc.search('text table tbody tr td a').each do |link|
 #    puts link['href']
 #  end
# //*[@id="text"]/table[1]/tbody/tr[3]/td/a

# puts "### Or mix and match."
# doc.search('nav ul.menu li a', '//article//h2').each do |link|
#   puts link.content
# end

# (1..50).each do |i|
#   puts doc.xpath(%Q(//*[@id="listitem_page1"]/div[#{i}]/a)).methods
# end
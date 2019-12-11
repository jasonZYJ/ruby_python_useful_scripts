#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('https://www.66e.cc/dsj4/20191208/40332.htm')) #《罗马蓝光未删减[2季全]》

#Wrong Example
# puts "### Search for nodes by xpath"
#  doc.xpath('//*[@id="listitem_page1"]', '//div/a').each do |link|
#   puts link.attr("href")
# end


#Correct Example
# doc.xpath('//*[@id="listitem_page1"]//div//a').each do |link|
#   puts link.attr("href") unless link.nil?
# end

link_num = 0

# 电影链接的原始 Xpath [//*[@id="text"]/table/tbody/tr[7]/td/a]
doc.xpath('//*[@id="text"]//table//tbody//tr//td//a').each do |link|
  if !link.nil? && link.content.end_with?('.mp4')
    puts link.attr("href") 
    link_num+=1
  end
end

puts "此次一共获取了#{link_num}个电影下载地址!"


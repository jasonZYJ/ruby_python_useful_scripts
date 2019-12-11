#! /usr/bin/env ruby

# 思路：
# => A.遍历目录对象
# => B.获取目录下的文件名称File对象
# => C.判断文件后缀格式
# => D.截取新的文件命名
# => E.重命名
require 'find'
require 'pathname'
require 'fileutils'

puts "#####################开始脚本处理#######################"
puts "########################################################"
DIR_MOVIES = "/Users/J-Y/Downloads/游钓中国 第四季"
i = 0 #定义变量记录所有的符合规定格式的文件数量

Find.find(DIR_MOVIES) do |filename| 
  unless FileTest.directory?(filename)
    begin
      # puts FileTest.directory?(filename)
      puts "#{i}.开始处理 #{filename}"
      new_name = filename.gsub(/ ?\[.*\./, '.')
      puts "#{i}.此次处理后的文件名是 #{new_name}"
      File.rename(filename, new_name)
      i = i + 1
    rescue Exception => e
    end
  end
end

p "本次处理了 #{i} 个文件"


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
DIR_PHOTOS = "/Users/J-Y/Project/test_photo_rename/"
i = 0 #定义变量记录所有的符合规定格式的文件数量
j = 0 #记录被处理过的文件数量

Find.find(DIR_PHOTOS) do |filename| 
    path = Pathname.new(filename)
    extname = path.extname      # 文件后缀名
    begin
        if extname == ".JPG" || extname == ".png" || extname == ".jpg" || extname == ".jpeg" || extname == ".PNG"
            i = i + 1
            primary_name = path.basename        # 文件名
            if extname == ".jpeg"
                new_name = primary_name.to_s[-11..-1]       # 截取新的文件名
            elsif extname == ".JPG"
                new_name = primary_name.to_s[-10..-4] + "jpg"
            elsif extname == ".PNG"
                new_name = primary_name.to_s[-10..-4] + "png"
            else
                new_name = primary_name.to_s[-10..-1]
            end
            puts "-------------第#{i}张照片原名为:  #{primary_name}"
            if new_name.include?("+")
                puts "  \033[31m #{primary_name}格式不对,不做修改 \031"
            else
                j = j + 1
                File.rename(filename,new_name)
                puts "\033[36m----------------将被重命名为:  #{new_name}\033[0m\n"
            end
            puts "   \033[34mnext..\033[0m"
            puts ""
        end
    rescue Exception => e
    
    end
end
puts "一共有 #{i} 张照片"
puts "本次处理了 #{j} 张照片"


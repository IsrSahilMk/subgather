#!/usr/bin/env ruby
require 'open-uri'
require 'json'

if File.zero?("keys/virustotalkey.txt") == true then puts "Virustotal API Key not added, please add the API key in keys/virustotalkey.txt" end


TC = "https://www.threatcrowd.org/searchApi/v2/domain/report/?domain="

dom = ARGV[0]

tc_res = open(TC + dom).read

tc_parsed = JSON.parse(tc_res)
arr_tc =  tc_parsed["subdomains"]
puts "\nResults from Threatcrowd:\n\n"
arr_tc.each {|sub| puts " " + sub.to_s }

File.open("tc_#{dom}.txt", "w+") do |f|
  f.puts(arr_tc)
end




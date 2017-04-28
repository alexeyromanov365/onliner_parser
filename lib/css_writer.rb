require 'csv'


a = ["aaa, bbb, ccc", "ddd", ["lll", "kkk"]]

a.each do |m|
  puts m
end


File.open("apartments_data.csv", "a+") { |f| f.write(a.to_csv) }








binding.pry
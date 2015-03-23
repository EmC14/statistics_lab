f = File.new("./cbp10st.txt", "r")
country_data = f.read
f.close
data = country_data.split("\n")

sum = 0
sum2 = 0
data.each do |data_point|
  data_point_values = data_point.split(",")
  data_value = data_point_values[5].to_f
  sum = sum + data_value
end
data.each do
  sum2 = sum2 + 1
end
mean = sum/sum2

puts mean
data_value = 0
varsum2 = 0
varsum = 0
data.each do |data_point|
  data_point_values = data_point.split(",")
  data_value = data_point_values[5].to_f
  varsum2 = data_value - mean
  varsum = varsum2**2
end

varnum = sum2 - 1
varout = varsum/varnum
varoutfin = varout**0.5
puts varoutfin
zscore = 0
f2 = File.new("./cbp10stout.txt", "w")
data.each do |data_point|
  data_point_values = data_point.split(",")
  data_value = data_point_values[5].to_f
  zscore =  data_value - mean/varoutfin
  f2.write zscore
  f2.write "\n"
end
f2.write "\n Standard Deviation \n"
f2.write varoutfin
f2.write "\n Mean \n"
f2.write mean
f2.close
puts "data"
f3 = File.new("./cbp10stout.txt", "r")
zscoredata = f3.read
f3.close
puts zscoredata
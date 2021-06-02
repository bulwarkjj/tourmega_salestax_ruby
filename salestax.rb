flag = TRUE
sales_tax = 0.0
total = 0.0
exempt_list = ["chocolate bar", "book", "packet of headache pills"]
receipt = []

while flag
  puts " do you have items to add? y/n"
  check = gets.chomp
  if check.downcase == 'y'
    puts "Please enter the Quantity, Product, Price seprated by a comma:"
    user = gets.chomp
    user = user.split(',')
    receipt.append(user)
  elsif check.downcase == 'n'
    flag = FALSE

  end
end

while receipt.length > 0
  if exempt_list.include? receipt[0][1]
    puts "#{receipt[0][0]},#{receipt[0][1]},#{receipt[0][2]}"
  elsif (receipt[0][1].include? "imported") && (receipt[0][1].include? "chocolates")
    puts "#{receipt[0][0]},#{receipt[0][1]},#{(receipt[0][2]).to_f + ((receipt[0][2]).to_f * 0.05).round(2)}"
    sales_tax += (receipt[0][2]).to_f * 0.05
  elsif (receipt[0][1].include? "imported") && (receipt[0][1].include? "perfume")
    puts "#{receipt[0][0]},#{receipt[0][1]},#{(receipt[0][2]).to_f + ((receipt[0][2]).to_f * 0.15).round(2)}"
    sales_tax += (receipt[0][2]).to_f * 0.15
  else
    puts "#{receipt[0][0]},#{receipt[0][1]},#{((receipt[0][2]).to_f + (receipt[0][2]).to_f * 0.10).round(2)}"
    sales_tax += (receipt[0][2]).to_f * 0.10
  end
  total += sales_tax + (receipt[0][2]).to_f
  receipt.shift
end
puts "Sales Taxes: #{sales_tax.round(2)}"
puts "Total: #{total.round(2)}"
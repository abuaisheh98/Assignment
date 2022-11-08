require_relative 'ArrayAssignment'

puts "How many elements do you want in your array?"
user_response=gets.chomp.to_i

user_array=Array.new(user_response)

count=0
while count!=user_array.size
	puts "Enter your item\n#{count}-"
	user_array[count]=gets.chomp.to_i
	count+=1
end

puts "Select from this\n1- print array as it is\n2- Sort array ascending and print it\n3- Sort array descending and print it\n4- return the max number\n5- return the min number\n6- add elements\n7- delete element at any index\n8- remove duplicated and print the array\n9- print array as string , separated by comma\n10- print elements that bigger than following number"
user_choice=gets.chomp.to_i
my_array=ArrayAssignment.new
begin
	case user_choice
	when 1
		my_array.print_array(user_array)
	when 2
		my_array.sort_array_ascending(user_array)
	when 3
		my_array.sort_array_descending(user_array)
	when 4
		my_array.max_number(user_array)
	when 5
		my_array.min_number(user_array)
	when 6
		my_array.add_element(user_array)
	when 7
		my_array.delete_element(user_array)
	when 8
		my_array.remove_duplicated(user_array)
	when 9
		my_array.print_array_as_string(user_array)
	when 10
		my_array.print_the_bigger_elements(user_array)
	else
		raise "Incorrect entry, please try again"
	end
rescue => e
	puts e.message
	retry
end
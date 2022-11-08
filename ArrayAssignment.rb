class ArrayAssignment


	def print_array(array)
		puts array
	end

	def sort_array_ascending(array)
		puts array.sort!.join(',')
	end

	def sort_array_descending(array)
		puts array.sort {|x, y| y <=> x}.join(',')
	end

	def max_number(array)
		puts array.max
	end

	def min_number(array)
		puts array.min
	end

	def add_element(array)
		begin
			puts "Where do you want to add the item?\n1-to the end\n2-to the first\n3-at any index"
			user_response=gets.chomp.to_i
			puts "Enter the number you want to add"
			number_from_user=gets.chomp.to_i

			case user_response
			when 1
				puts array.push(number_from_user)
			when 2
				puts array.unshift(number_from_user)
			when 3
				puts "Where do you want to add this number?"
				position=gets.chomp.to_i
				puts array.insert(position,number_from_user)
			else 
				raise "Incorrect entry, please try again"
			end

		rescue =>e
			puts e.message
			retry
		end

	end

	def delete_element(array)
		puts "From which site do you want to delete the item?"
		position=gets.chomp.to_i
		array.delete_at(position)
	end

	def  remove_duplicated(array)
		puts array.uniq
	end

	def print_array_as_string(array)
		puts array.join(',')
	end

	def print_the_bigger_elements(array)
		puts "Enter your number"
		number=gets.chomp.to_i
		for i in 0...(array.size)
  			if array[i] > number
    			puts array[i]
    		end
        end
  end

end

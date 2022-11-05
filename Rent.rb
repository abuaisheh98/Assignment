class Vehicles 
	attr_accessor :id,:model,:color,:daily_rental_price
end

class VehiclesFactory
	def creat_motor(id,model,color)
		motor=Vehicles.new
		motor.daily_rental_price=20
		motor.color=color
		motor.model=model
		motor.id=id
		motor
	end

	def creat_car(id,model,color)
		car=Vehicles.new
		car.daily_rental_price=50
		car.color=color
		car.model=model
		car.id=id
		car
	end

	def creat_van(id,model,color)
		van=Vehicles.new
		van.daily_rental_price=70
		van.color=color
		van.model=model
		van.id=id
		van
	end
end

class Rent
	attr_accessor :number_of_days,:vehicle_type,:vehicles,:total_price

	def rental_information
		return "Rental information :\nVehicle type is #{vehicle_type}\nNumber of rental days #{number_of_days}\nTotal Price is #{total_price}"
	end
end

class RentingServices

	def get_offer(vehicle_type,number_of_days)
		rent=Rent.new
		rent.number_of_days=number_of_days

		case vehicle_type
		when 1
			rent.vehicle_type="motor"
		when 2
			rent.vehicle_type="car"
		when 3
			rent.vehicle_type="van"
		else
			puts "Sorry,your selection is not available"
		end

		rent.vehicles=creat_vehicle(vehicle_type)
		discount=discount_calculator(number_of_days,rent.vehicles.daily_rental_price)*number_of_days
		rent.total_price=discount

		rent
	end

	def discount_calculator(number_of_days,price)
		case number_of_days
		when 1..2
		when 3..5
			price -=(price*0.1)
		when 6..10
			price -=(price*=0.3)
		else
			price -=(price*0.4)
		end
		price
	end

	def creat_vehicle(vehicle_type)
		factory =VehiclesFactory.new
		vehicle=Vehicles.new

		case vehicle_type
		when 1
			factory=VehiclesFactory.new
			vehicle=factory.creat_motor("1224","Sport","Black")
		when 2
			factory=VehiclesFactory.new
			vehicle=factory.creat_car("2544","Hatchback","Red")
		when 3
			factory=VehiclesFactory.new
			vehicle=factory.creat_van("3058","Minibus","White")
		end

		vehicle
	end
end


begin
	puts "Welcom to the Hot Wheels for rent a vehicle\nPlease select the type of vehicle you would like to rent\n1.MotorCycle\n2.Car\n3.Van"
	user_choice=gets.chomp.to_i
	raise "Sorry,Your selection is not available" if user_choice<1 or user_choice>3
	puts "How many days do you want to rent it ?"
	number_of_days=gets.chomp.to_i
	renting_services=RentingServices.new
	rent=Rent.new
	rent=renting_services.get_offer(user_choice,number_of_days)
	puts rent.rental_information

	puts "Do you want to accept this offer ?\n1-Confirm\n2-Try another"
	user_response=gets.chomp.to_i
	raise "try another" if user_response==2 or user_response>2 or user_response<1	
rescue  => e
	puts e.message
	retry	
end


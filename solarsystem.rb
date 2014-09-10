
#THIS IS SOURCE CODE
#THIS IS A PLANET FACTORY IT MAKES INSTANCES OF PLANETS
class Planet
  attr_accessor :name, :moon, :position_from_sun, :rotation_days, :life, :distance_from_sun

  def initialize(planet_array)
    @name = planet_array[:name]
    @moon = planet_array[:moon]
    @position_from_sun = planet_array[:position_from_sun]
    @rotation_days = planet_array[:rotation_days]
    @life = planet_array[:life]
    @distance_from_sun = planet_array[:distance_from_sun]
  end

  def planet_age(formation)
    formation/@rotation_days
  end

  def self.distance(a_solar_system)
    puts "Choose a planet."
    a_planet_name = gets.chomp
    planet1 = a_solar_system.planet_value(a_planet_name)

    puts "Choose another planet"
    another_planet_name = gets.chomp
    planet2 = a_solar_system.planet_value(another_planet_name)

    if planet1.distance_from_sun - planet2.distance_from_sun < 0
      puts planet2.distance_from_sun - planet1.distance_from_sun
    else
      puts planet1.distance_from_sun - planet2.distance_from_sun
    end
  end
end

#THIS IS A SOLAR SYSTEM FACTORY, IT CREATES INSTANCES OF SS'S
#THAT HAS A PLANETS ATTRIBUTE
class SolarSystem
  attr_accessor :planets, :formation

  def initialize
    @planets = [ ]
    @formation = 46_000_000_000
  end

  def planet_value(a_planet_name)
    case
    when a_planet_name.include?("earth")
        a_planet_name = @planets[0]
    when a_planet_name.include?("mars")
        a_planet_name = @planets[1]
    when a_planet_name.include?("saturn")
        a_planet_name = @planets[2]
    else
        puts "That's not a planet name. Try again."
        a_new_planet_name = gets.chomp
        planet_value(a_new_planet_name)
    end
  end
end

    #THIS IS PROGRAM
    #THIS IS AN ARRAY FILLED WITH ATTRIBUTES:
    planet = [{name: "Earth", moon: 1, position_from_sun: "3rd", rotation_days: 365, life: "yes", distance_from_sun: 93_000_000},
      {name: "Mars", moon: 2, position_from_sun: "4th", rotation_days: 686, distance_from_sun: 141_000_000},
      {name: "Saturn", moon: 53, position_from_sun: "6th", rotation_days: 10_759, distance_from_sun: 890_700_000}]
    #I WANT TO ASK FOR INPUT FROM USER AND PUSH THAT INTO THE ARRAY??
    #CREATE NEW INSTANCE OF SOLAR SYSTEM
    new_solar_system = SolarSystem.new
    #THIS IS RUNNING AN EACH LOOP THAT IS CREATING NEW INSTANCES OF PLANET
    #VIA PLANET FACTORY (@new_planet = Planet.new(hash)
    #ASSIGNING APPROPRIATE ATTRIBUTES FROM ARRAY TO EACH
    #THEN PUSHING EACH HASH TO THE SOLAR SYSTEM I CREATED
    planet.each do |hash|
      new_planet = Planet.new(hash)
      new_solar_system.planets.push(new_planet)
    end

    #PLANET AGE
    new_solar_system.planets.each do |name|
      puts name.planet_age(new_solar_system.formation)
    end

    #PLANET DISTANCE
    Planet.distance(new_solar_system)
    #puts new_solar_system.planets[1].distance_from_sun - new_solar_system.planets[0].distance_from_sun

    #PROGRAM THAT ALLOWS USER TO CHOOSE WHAT INFORMATION IS RETURNED
    puts "What planet would you like to learn about? Earth, Mars, or Saturn?"
    planet_name = gets.chomp.downcase
    puts "And what would you like to know about it?"

    planet_value = new_solar_system.planet_value(planet_name)

    puts "Number of moons, rotation, or position from sun?"
    planet_attribute = gets.chomp.downcase


    case
      when planet_attribute.include?("moon")
        answer = new_solar_system.planet_value(planet_name).moon
        puts answer
      when planet_attribute.include?("position")
        answer = new_solar_system.planet_value(planet_name).position
        puts answer
      when planet_attribute.include?("rotation")
        answer = new_solar_system.planet_value(planet_name).rotation_days
        puts answer
      when planet_attribute.include?("life")
        answer = new_solar_system.planet_value(planet_name).life
        puts answer
      else
        puts "That is not a planet attribute"
    end

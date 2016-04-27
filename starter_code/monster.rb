# Monster class
class Monster
  @@count = 0
  THREAT_LEVELS = [:low,:medium,:high,:midnight]
  THREAT_LEVELS.freeze
  attr_accessor :class_description, :habitat, :get_dangerous, :threat_level, :name
  def self.count
    @@count
  end
  def self.THREAT_LEVELS
    @@THREAT_LEVELS
  end
  def initialize(threat_level=:medium, name="anon", habitat="the ocean", class_description="A Scary Monster!")
    [:low,:medium,:high,:midnight].include? threat_level ? @threat_level=threat_level : raise {"initialize: cannot create monster - invalid threat level"}
    @name=name
    @habitat=habitat
    @class_description=class_description
    @@count += 1
    @@THREAT_LEVELS = [:low,:medium,:high,:midnight]
    puts "RAWR!"
    puts "There are now #{@@count} monsters roaming the world!"
  end
  def habitat?(habitat)
    if self.habitat==habitat
      return true
    else
      return false
    end
  end
  def fight(monster1,monster2)
    if Monster::THREAT_LEVELS.index(monster2.threat_level) >= Monster::THREAT_LEVELS.index(monster1.threat_level)
      winner=monster2
    else
      winner=monster1
    end
    puts "winner is:"
    p winner
  end
  def <=>(monster2)
    Monster::THREAT_LEVELS.index(self.threat_level) <=> Monster::THREAT_LEVELS.index(monster1.threat_level)
  end
  def get_dangerous
   # ruby version of a switch statement is case
   case @threat_level
     when :low
       @threat_level = :medium
     when :medium
       @threat_level = :high
     when :high
       @threat_level = :midnight
     when :midnight
       :midnight
   end
  end
end
  # getters and setters for instance variables
  # class variable for count
  # class instance variable for class description
  # class method getter for @@count class variable
  # class method getter for @class_description class instance variable
  # initial behavior
  # habitat? instance method
  # get_dangerous instance method
  # fight class method
# Zombie class
rabbit = Monster.new(:friendly)
p rabbit.threat_level

rabbit.habitat="Cave of Caerbannog"
p rabbit.habitat
p rabbit.habitat?("tundra")
dalek = Monster.new(:high)
p dalek.threat_level
teletubby = Monster.new(:low)
p teletubby.threat_level

zombie=Monster.new(:low)
p zombie
zombie.class_description="Zombie is walking dead. It roams around looking for people to devour."
  # zombie version of class_description

  # initial behavior and values

# Werewolf class
werewolf=Monster.new(:medium,"Frankenstein")
p werewolf
  # werewolf version of class_description

  # initial behavior and values

  # update_threat_level instance method

# Flying module

  #fly method

# Vampire class
vampire=Monster.new(:high,"Spongebob")
p vampire
  # vampire class description

  # Flying module included
alien = Monster.new(:midnight,"Fluffy")
p alien
predator = Monster.new(:high)
p predator
p Monster.count
p Monster.THREAT_LEVELS
p Monster::count
p Monster::THREAT_LEVELS
vampire.fight(vampire,werewolf)
class Zombie<Monster
  def initialize(habitat="graveyard",class_description="Walking dead!")
    super
      @habitat=habitat
      @class_description=class_description
  end
end
class Werewolf<Monster
  def initialize(threat_level=:low,class_description="A furry but vicious dog!")
    super
      @class_description=class_description
      @threat_level=threat_level
  end
  def update_threat_level(full_moon=true)
    if full_moon
      self.threat_level="midnight"
    end
  end
end

module Flying
  def fly
    puts self.name+" soars through the air!"
  end
end

class Vampire<Monster
  include Flying
  def initialize(habitat="coffin",class_description="It's a Leech!")
    super
      @habitat=habitat
      @class_description=class_description
  end
end



rob = Zombie.new
puts rob.habitat
rob.name = "Rob Zombie"
puts rob.name
p rob
teen_wolf = Werewolf.new
puts teen_wolf.threat_level
p teen_wolf

dracula = Vampire.new(:high)
dracula.name = "Count Dracula"
dracula.fly

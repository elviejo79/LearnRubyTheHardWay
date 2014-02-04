## Animal is-a object look atthe extra credit
class Animal
end

## Create a class Dog that is-an Animal
class Dog < Animal
  def initialize(name)
    ## ?? 
    @name = name
  end
end

## Cat is-a also Animal
class Cat < Animal
  def initialize(name)
    ## ??
    @name = name
  end
end

## Define a class Persan that has an attribute name and pet. 
## when just created a person has a name but not a pet
class Person
  def initialize(name)
    ## ??
    @name = name
    ## Person has-a pet of some kind
    @pet = nil
  end
  attr_accessor :pet
end

class Employee < Person
  def initialize(name, salary)
    ## ?? hm what is this strange magic?
    ## call the initialize for person that this employee inherits from with the name parameter
    super(name)
    ## set the employee's salary
    @salary = salary
  end
end

## Define a class fish
class Fish
end

## Salmon is-a kind of Fish
class Salmon < Fish
end

## Halibut is-another kind of fish
class Halibut < Fish
end

## rover is-a Dog
rover = Dog.new("Rover")

## satan is-a Cat
satan = Cat.new("Satan")

## mary is-a Person
mary = Person.new("Mary")

## mary has-a pet a cat named satan
mary.pet = satan

## frank is-a employee with a salary 120,000
frank = Employee.new("Frank", 120000)

## frank is-also a person who has a pet rover. and rover is-a Dog
frank.pet = rover

## flipper is-a fish
flipper = Fish.new()

## crouse is-a salmon fish
crouse = Salmon.new()

## harry is-a halibut fish
harry = Halibut.new()

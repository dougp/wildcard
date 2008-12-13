class WildCardTest
  require "wildcard"
  include WildCard
  def the_X_stole_my_X(animal,something)
    "The #{animal} stole my fucking #{something}"
  end
  def hello_X_how_are_you(name)
    "goodbye #{name}"
  end
  def i_want_X_and_X_and_X_and_X_for_xmas(one,two,three,four)
    "#{one},#{two},#{three},#{four}"
  end
  def math_X_plus_X_equals(a,b,sum)
    a.to_i + b.to_i == sum
  end
  def self.helloX(name)
    name
  end
end

a=WildCardTest.new
if a.the_dog_stole_my_guitar == "The dog stole my fucking guitar" then puts "success" else raise "EPIC FAIL" end
if a.i_want_a_train_and_a_puppy_and_a_macbook_pro_the_new_one_and_a_cat_for_xmas=="a_train,a_puppy,a_macbook_pro_the_new_one,a_cat" then puts "success" else raise "EPIC FAIL" end
begin 
  a.whoops
rescue NoMethodError
  puts "success"
end
if a.math_2_plus_3_equals(5) then puts "success" else raise "EPIC FAIL" end
if WildCardTest.helloDoug=="Doug" then puts "success" else raise "EPIC FAIL" end
begin
  WildCardTest.whoops
rescue NoMethodError
  puts "success"
end

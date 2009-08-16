require 'test/unit'

class WildCardTest < Test::Unit::TestCase
  def test_setup #just makes sure that the method is defined
    assert( TestBase.new.the_X_stole_my_X("rat", "cheese") == "The rat stole my fucking cheese")
  end 
  def test_x_at_end
    assert( TestBase.new.the_rat_stole_my_cheese == "The rat stole my fucking cheese")
    assert( TestBase.new.the_big_rat_stole_my_small_cheese == "The big_rat stole my fucking small_cheese")
  end
  def test_confusing
    assert( TestBase.new.i_want_cat_and_dog_and_rat_and_mouse_for_xmas == "cat,dog,rat,mouse")
    assert( TestBase.new.i_want_cat_and_cat_and_cat_and_cat_for_xmas == "cat,cat,cat,cat")
  end
  def test_too_many_params
    assert( TestBase.new.math_4_plus_3_equals 7)
  end
  def test_class_methods
    assert( TestBase.helloDoug=="Doug")
  end
  
end
class TestBase
  require "../lib/wildcard"
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



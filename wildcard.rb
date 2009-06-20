module WildCard
  def the_X_stole_my_X(animal,something)
    "The #{animal} stole my fucking #{something}"
  end
  def hello_X_how_are_you(name)
    "goodbye #{name}"
  end
  #when the module is included overrides the class method of method missing so you can do MyClass.method type calls
  def WildCard.included(mod)
    def mod.method_missing(method_id, *arguments)
    results=WildCard.wildcard(methods,method_id,*arguments)
    if results then return send(results[0],*results[1]) end
    super
    end
  end

  def method_missing(method_id , *arguments)
    results=WildCard.wildcard(methods,method_id,*arguments)
    if results then return send(results[0],*results[1]) end
    super
  end
  def self.wildcard methods, method_id, *arguments
    letter="[A-Za-z0-9_]+"
    wildcards=methods.map{|x| x.to_s}.select{|x| x.index('X')}.map{|x| {:name=>x,:parts=>x.split('X')}}
    my_method=wildcards.detect{|x| 
      method_id.to_s.match(Regexp.new("^#{x[:parts].join(letter)}#{if x[:name][-1..-1]=='X' then letter end}$"))
    }
    if my_method then 
      output=WildCard.remove_strings(method_id.to_s,my_method[:parts]) + arguments
      return [my_method[:name], output]
    else
      return nil
    end
  end
  #recursive function that removes instances in to_remove from string and returns an array of the leftovers
  def self.remove_strings(string, to_remove)
    if to_remove.size==0 then
      return (if string=="" then [] else [string] end)
    else
      count=string=~Regexp.new(to_remove.first)
      return (if count==0 then [] else [string[0..(count-1)]] end) + remove_strings(string[(count+to_remove.first.size)..-1],to_remove[1..-1])
    end
  end
end

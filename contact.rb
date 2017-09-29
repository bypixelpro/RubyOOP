# attr_reader define un getter
# attr_writer define un setter" 
# attr_accessor define setters and getters

class Contact
  attr_writer :first_name, :middle_name, :last_name

  def first_name
    @first_name
  end

  def middle_name
    @middle_name
  end

  def last_name
    @last_name
  end

  def full_name
  	#full_name = "#{first_name} #{middle_name} #{last_name} " #Nos deja un hueco
  	
  	full_name = first_name
    if !@middle_name.nil?
      full_name += " "
      full_name += middle_name
    end
    full_name += ' '
    full_name += last_name
    full_name
  end

end

david = Contact.new
david.first_name = "david"
david.last_name = "pique"

#puts david.first_name + " " + david.last_name
puts david.full_name

#Añadimos otro
daniel = Contact.new
daniel.first_name = "Daniel"
daniel.middle_name = "de"
daniel.last_name = "Maria"
puts daniel.full_name




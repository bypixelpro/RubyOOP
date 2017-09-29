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

  #Creamos otro metodo para llamar a la perosna por su apellido primero
  #y mostramos solo la primera letra del nombre
  def last_first
    last_first = last_name
    last_first += ", "
    last_first += first_name
    if !@middle_name.nil?
      last_first += " "
      last_first += middle_name.slice(0, 1)
      last_first += "."
    end
    last_first
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
puts david.last_first


#Añadimos otro
daniel = Contact.new
daniel.first_name = "Daniel"
daniel.middle_name = "de"
daniel.last_name = "Maria"
puts daniel.full_name
puts daniel.last_first





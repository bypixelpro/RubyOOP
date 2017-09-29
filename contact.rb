require "./phone_number"


# attr_reader define un getter
# attr_writer define un setter" 
# attr_accessor define setters and getters

class Contact
  attr_writer :first_name, :middle_name, :last_name
  attr_reader :phone_numbers

#Inicializamos el phone number attr_reader como un array vacio
  def initialize
    @phone_numbers = []
  end
#Creamos un metodo para añadir valores al array
  def add_phone_number(kind, number)
    phone_number = PhoneNumber.new
    phone_number.kind = kind
    phone_number.number = number
    phone_numbers.push(phone_number)
  end

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

  #Sobreescribimos el metodo to_string y creamos el metodo first last
  def to_s(format = 'full_name')
    case format
    when 'full_name'
      full_name
    when 'last_first'
      last_first
    when 'first'
      first_name
    when 'last'
      last_name
    else
      first_last
    end
  end

def first_last
    first_name + " " + last_name
  end

  #Imprimimos los números de telefono con each y el bloque
  def print_phone_numbers
    puts "Phone Numbers"
    phone_numbers.each { |phone_number| puts phone_number }
  end

end

david = Contact.new
david.first_name = "david"
david.last_name = "pique"
david.add_phone_number("Casa", "91 765 23 12")
david.add_phone_number("Móvil", "654 442 378")
puts david.to_s('full_name')
david.print_phone_numbers



#puts david.first_name + " " + david.last_name
puts david.full_name
puts david.last_first

#Pasamos el to_s
puts david.to_s
puts david.to_s('full_name')
puts david.to_s('last_first')


#Añadimos otro
daniel = Contact.new
daniel.first_name = "Daniel"
daniel.middle_name = "de"
daniel.last_name = "Maria"
puts daniel.full_name
puts daniel.last_first





require "./contact"

class AddressBook
    attr_reader :contacts
  
    def initialize
      @contacts = []
    end

#Creamos un menu para los usuarios
  def run
    loop do
      puts "Mi primer programa en Ruby iContactPro"
      puts "a: Añadir un contacto"
      puts "p: Mostrar contactos"
      puts "s: Salir"
      print "Instrucción: "
      input = gets.chomp.downcase
      case input
      when 'a'
        add_contact
      when 'p'
        print_contact_list
      when 's'
        break  
      end
    end
  end
  
  def add_contact
    contact = Contact.new
    print "Nombre: "
    contact.first_name = gets.chomp
    print "Apellido: "
    contact.middle_name = gets.chomp
    print "Apellido 2: "
    contact.last_name = gets.chomp
    contacts.push(contact)
  end




#Iteramos cada contacto, si el nombre coincide con el argumento, sacamos el resultado
    def find_by_name(name)
        results = []
        search = name.downcase #vamios a igual todo en minusculas
        contacts.each do |contact|
          if contact.full_name.downcase.include?(search)#para los string, tenemos el metodo include, que lo comprar y busca en otro string
            results.push(contact)
          end
        end
=begin
        #Imprimimos el resultado en pantalla
        puts "Resultado de la busqueda (#{search})"
        #Iteramos sobre el resultado
        results.each do |contact|
          puts contact.to_s('full_name')
          contact.print_phone_numbers
          contact.print_addresses
          puts "\n"
=end
print_results("Búsqueda de contacto: (#{search})", results)

        
      end 

      #Nuevo método para buscar por el telefono
      def find_by_phone_number(number)
        #creamos un array vacio, no lo instanciamos por que es local para este metodo, ningun otro metodo accedera salvo que lo pasemos nosotors
        results = []
        #iniciamos la busqueda y esta vez, remplazaremos todos los - con ""nada con el meotdo gsub
        search = number.gsub("-", "")
        #Loop a traves de los contactos y sus telefonos
        contacts.each do |contact|
          contact.phone_numbers.each do |phone_number|
            #Si hay resultados, se lo enchufamos al array result
            if phone_number.number.gsub("-", "").include?(search)
                #Añadimos el resultado solo si no esta ya incluido, para no repetir unless results.include?(contact)
              results.push(contact) unless results.include?(contact)
            end
          end

        end
        print_results("Búsqueda de teléfono: (#{search})", results)
        
      end 

      #Nuevo método y final para buscar por la dirección+
      def find_by_address(query)
        results = []
        #La variable search sera una version downcase de la query que hagamos
        search = query.downcase
        #iteramos los contactos
        contacts.each do |contact|
            #y luego las direcciones
          contact.addresses.each do |address|
            #si esta en la version larga, hacemos un push en el resultado del array
            if address.to_s('larga').downcase.include?(search)
              results.push(contact) unless results.include?(contact)
            end
          end
        end
        print_results("Búsqueda por dirección: (#{search})", results)
      end

      def print_results(search, results)
        puts search
        results.each do |contact|
          puts contact.to_s('full_name')
          contact.print_phone_numbers
          contact.print_addresses
          puts "\n"
        end
      end


  
    def print_contact_list
      puts "Contactos encontrados:"
      contacts.each do |contact|
        puts contact.to_s('last_first')
      end
    end
  end
  
  address_book = AddressBook.new
  address_book.run

  
  
  
  
=begin
  david = Contact.new
  david.first_name = "David"
  david.last_name = "Piqué"
  david.add_phone_number("Casa", "91 765 23 12")
  david.add_phone_number("Móvil", "654 442 378")
  david.add_address("Trabajo", "los robles 17", "", "Madrid", "Madrid", "28009")


  daniel = Contact.new
  daniel.first_name = "Daniel"
  daniel.last_name = "Ariza"
  daniel.add_phone_number("Casa", "91 765 23 12")
  daniel.add_phone_number("Móvil", "654 442 370")
  daniel.add_address("Trabajo", "Ronda de Segovia 50", "", "Madrid", "Madrid", "28009")
  

  
  address_book.contacts.push(david)
  address_book.contacts.push(daniel)
  
  #address_book.print_contact_list

  #address_book.find_by_name("é")
  #address_book.find_by_phone_number("0")
  address_book.find_by_address("robles")
  
=end
  
require "./contact"

class AddressBook
    attr_reader :contacts
  
    def initialize
      @contacts = []
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
        #Imprimimos el resultado en pantalla
        puts "Resultado de la busqueda (#{search})"
        #Iteramos sobre el resultado
        results.each do |contact|
          puts contact.to_s('full_name')
          contact.print_phone_numbers
          contact.print_addresses
          puts "\n"
        end
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
              results.push(contact) unless results.include?(contact)
            end
          end

        end
        puts "Resultado de la busqueda (#{search})"
        #V1 Iteramos sobre el resultado sin tener el cuenta el DRY
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

  david = Contact.new
  david.first_name = "David"
  david.last_name = "Piqué"
  david.add_phone_number("Casa", "91 765 23 12")
  david.add_phone_number("Móvil", "654 442 378")
  david.add_address("Trabajo", "Ronda de Segovia 50", "", "Madrid", "Madrid", "28009")


  daniel = Contact.new
  daniel.first_name = "Daniel"
  daniel.last_name = "Ariza"
  daniel.add_phone_number("Casa", "91 765 23 12")
  daniel.add_phone_number("Móvil", "654 442 378")
  daniel.add_address("Trabajo", "Ronda de Segovia 50", "", "Madrid", "Madrid", "28009")
  

  
  address_book.contacts.push(david)
  address_book.contacts.push(daniel)
  
  #address_book.print_contact_list

  #address_book.find_by_name("é")
  address_book.find_by_phone_number("65")
  
  
require "./contact"

class AddressBook
    attr_reader :contacts
  
    def initialize
      @contacts = []
    end
  
    def print_contact_list
      puts "Contact List"
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
  
  address_book.print_contact_list
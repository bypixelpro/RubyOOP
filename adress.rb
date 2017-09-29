class Address
    attr_accessor :kind, :street_1, :street_2, :city, :state, :postal_code
  
    def to_s(format = 'corta')
      address = ''
      case format
      when 'larga'
        address += street_1 + "\n"
        address += street_2 + "\n" if !street_2.nil?
        address += "#{city}, #{state} #{postal_code}"
      when 'corta'
        address += "#{kind}: "
        address += street_1
        if street_2
          address += " " + street_2
        end
        address += ", #{city}, #{state}, #{postal_code}"
      end
      address
    end
  end
  
=begin solo para pruebas
  home = Address.new
  home.kind = "Casa"
  home.street_1 = "Calle Los Robles"
  home.city = "Guadalix de la Sierra"
  home.state = "Madrid"
  home.postal_code = "28794"
  
  puts home.to_s('corta')
  puts "\n"
  puts home.to_s('larga')

=end
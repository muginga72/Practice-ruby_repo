require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_results(search, results)
    puts search
    results.each do |contact|
      puts contact.to_s("full_name")
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do | contact |
      if contact.full_name.downcase.include?(search) 
        results.push(contact)
      end
    end
    print_results("Name search results (#{search})", results)
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do | contact |
      contact.phone_numbers.each do | phone_number |
        if phone_number.number.gsub("-", "").include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone search results (#{search})", results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do | contact |
      contact.addresses.each do | address |
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address search results (#{search})", results)
  end

  def print_contact_list 
    puts "Contact List"
    contacts.each do | contact |
      puts contact.to_s("last_first")
    end
  end
end

address_book = AddressBook.new

joshua = Contact.new
joshua.first_name = "Joshua"
joshua.last_name = "James"
joshua.add_phone_number("Home", "123-456-7890")
joshua.add_phone_number("Work", "207-874-8250")
joshua.add_address("Home", "1234 Main St.", "", "Portland", "OR", "12345")

eli = Contact.new
eli.first_name = "Eli"
eli.last_name = "James"
eli.add_phone_number("Home", "999-456-7890")
eli.add_phone_number("Work", "207-874-8260")
eli.add_address("Home", "3698 Main St.", "", "Portland", "OR", "12345")

address_book.contacts.push(joshua)
address_book.contacts.push(eli)
#address_book.print_contact_list
#address_book.find_by_name("e")
#address_book.find_by_phone_number("9")
address_book.find_by_address("3698")
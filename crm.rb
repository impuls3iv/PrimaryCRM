require_relative 'contact'

class CRM

  attr_accessor :name

  def initialize(name)
    #binding.pry
    puts "Okay, this CRM has the name " + name
    @name = name
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then abort("You have ended the CRM.  Goodbye.")
    end
  end


  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    # print 'Enter a describing word for the contact'
    # contact_describe = gets.chomp!
    # @contact_describe = contact_describe

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    # puts "What is the ID of the contact you want to edit"
    # @contact_arg_id = gets.chomp!
    #
    puts "What is the ID of the contact?"
    id_argument = gets.chomp!
    puts "Which attribute do you want up update? (first, last, email or note)"
    att_update = gets.chomp!
    puts "What is the new value"
    att_value = gets.chomp!

    var1 = Contact.find(id_argument) #assign the nameless instance a name
    puts var1.update(att_update, att_value)


  end

  def delete_contact

    puts "What is the ID number of the contact you want to delete?"
    delete_id = gets.chomp!

    Contact.delete(delete_id)

    # delete_var = Contact.find(delete_id) #delete_var holds the object instance of class with the ID in delete_id
    # puts "#{delete_var}"
    # Contact.delete(de)

  end

  # This method should accept as an argument an array of contacts
  # # and display each contact in that array
  # def display_contacts
  #
  #   # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
  #
  #
  # end

  def display_all_contacts

    # HINT: Make use of the display_contacts method to keep your code DRY
    return Contact.all


  end

  def search_by_attribute

    # HINT: Make use of the display_contacts method to keep your code DRY
    #get user input
    puts "Do you want to search by first name (first), last name (last), email (email), or notes (note)?"
    att_find_by = gets.chomp!
    puts "What is the value of that attribute? (jon? sam@email.com? \'cool dude\'?)"
    val_find_by = gets.chomp!

    puts Contact.find_by(att_find_by, val_find_by)

  end

  # Add other methods here, if you need them.

end

crm = CRM.new("crm")
crm.main_menu

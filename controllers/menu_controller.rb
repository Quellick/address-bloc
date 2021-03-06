 # #1 include AddressBook using require_relative.
 require_relative '../models/address_book'
 
 class MenuController
   attr_reader :address_book
 
   def initialize
     @address_book = AddressBook.new
   end
 
   def main_menu
     # #2 display the main menu options to the command line.
     puts "Main Menu - #{address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - Exit"
     print "Enter your selection: "
 
     # #3  retrieve user input from the command line using  gets. gets reads the next line from standard input.
     selection = gets.to_i
     
     # #7 use a case statement operator to determine the proper response to the user's input
     case selection
       when 1
         system "clear"
         view_all_entries
         main_menu
       when 2
         system "clear"
         create_entry
         main_menu
       when 3
         system "clear"
         search_entries
         main_menu
       when 4
         system "clear"
         read_csv
         main_menu
       when 5
         puts "Good-bye!"
         # #8 terminate the program using exit(0). 0 signals the program is exiting without an error
         exit(0)
       # #9 use an else to catch invalid user input and prompt the user to retry.
       else
         system "clear"
         puts "Sorry, that is not a valid input"
         main_menu
     end
   end
 
   # #10  stub the rest of the methods called in main_menu
   def view_all_entries
     # #14 iterate through all entries in AddressBook using each.
     address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s
     # #15 we call  entry_submenu to display a submenu for each entry.
       entry_submenu(entry)
     end
 
     system "clear"
     puts "End of entries" 
   end
 
   def create_entry
     system "clear"
     puts "New AddressBloc Entry"
     # #12 use  print to prompt the user for each Entry attribute. print works just like puts, except that it doesn't add a newline.
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp
 
     # #13 add a new entry to address_book using  add_entry to ensure that the new entry is added in the proper order.
     address_book.add_entry(name, phone, email)
 
     system "clear"
     puts "New entry created"
   end
   
   def entry_submenu(entry)
     # #16 display the submenu options.
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"
 
     # #17 chomp removes any trailing whitespace from the string gets returns. This is necessary because "m " or "m\n" won't match "m".
     selection = gets.chomp
 
     case selection
     # #18 when the user asks to see the next entry, we can do nothing and control will be returned to view_all_entries.
       when "n" 
     # #19 we'll handle deleting and editing in another checkpoint, for now the user will be shown the next entry. 
       when "d"
       when "e"
     # #20 we return the user to the main menu.
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
   end
 
   def search_entries
   end
 
   def read_csv
   end
 end
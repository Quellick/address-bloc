require_relative '../models/address_book'
 
RSpec.describe AddressBook do
  # #1 We create new instance of the AddressBook model and assign it to the variable named book using the let syntax provided by RSpec. 
  # #  This lets us use book in all our tests, removing the duplication of having to instantiate a new AddressBook for each test.
   let(:book) { AddressBook.new }
   
    # #6
   def check_entry(entry, expected_name, expected_number, expected_email)
     expect(entry.name).to eq expected_name
     expect(entry.phone_number).to eq expected_number
     expect(entry.email).to eq expected_email
   end
 
  # #2 we see describe and it statements which are an RSpec paradigm to explain what we are testing. 
  # #  it explains the functionality of the method we're testing in a human readable form. RSpec will take the content from describe and it and output them nicely to the command line when we execute the test. 
  describe "attributes" do
    it "responds to entries" do
       expect(book).to respond_to(:entries)
       book.import_from_csv("entries.csv")
       # Check the first entry
       entry_one = book.entries[0]
       
       check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end
    
    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end
 
    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end    
  end
  
  describe "#add_entry" do
     it "adds only one entry to the address book" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       
       expect(book.entries.size).to eq(1)
     end
 
     it "adds the correct information to entries" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]
       
       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
  end
   
    # Test that AddressBook's .import_from_csv() method is working as expected
  describe "#import_from_csv" do
     it "imports the correct number of entries" do
       # #3 after the describe and it statements, we call the import_from_csv method on the book object which is of type AddressBook (our data model). We pass  import_from_csv the string entries.csv as a parameter. CSV files are a fairly typical way of dealing with data and you can read more about them here. 
       # #  On the next line we reference the AddressBook. entries variable to get its size. This variable will be an array. Next, we save the size of the AddressBook.entries to our local variable  book_size.
       book.import_from_csv("entries.csv")
       book_size = book.entries.size
       
        # Check the size of the entries in AddressBook
       expect(book_size).to eq 5
     end
       
     # #4 we access the first entry in the array of entries that our AddressBook stores.
     it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       # Check the first entry
       entry_one = book.entries[0]
 
       # #5 we've added three expects to verify that the first entry has the name "Bill", the phone number "555-555-4854", and the email address "bill@blocmail.com".
       check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
     end
     
     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
     end
 
     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
     end
 
     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
     end
 
     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
  end
  
  describe "#import_from_csv2" do
     it "imports the correct number of entries" do
       # #3 after the describe and it statements, we call the import_from_csv method on the book object which is of type AddressBook (our data model). We pass  import_from_csv the string entries.csv as a parameter. CSV files are a fairly typical way of dealing with data and you can read more about them here. 
       # #  On the next line we reference the AddressBook. entries variable to get its size. This variable will be an array. Next, we save the size of the AddressBook.entries to our local variable  book_size.
       book.import_from_csv("entries2.csv")
       book_size = book.entries.size
       
        # Check the size of the entries in AddressBook
       expect(book_size).to eq 3
     end
       
     # #4 we access the first entry in the array of entries that our AddressBook stores.
     it "imports the 1st entry" do
       book.import_from_csv("entries2.csv")
       # Check the first entry
       entry_one = book.entries[0]
       # #5 we've added three expects to verify that the first entry has the name "Bill", the phone number "555-555-4854", and the email address "bill@blocmail.com".
       check_entry(entry_one, "Tucker", "541-390-5325", "tucker@blocmail.com")
     end
     
     it "imports the 2nd entry" do
       book.import_from_csv("entries2.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Sara", "555-555-5415", "sara@blocmail.com")
     end
 
     it "imports the 3rd entry" do
       book.import_from_csv("entries2.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Tonya", "555-555-3660", "tonya@blocmail.com")
     end
  end
  
  # Test the binary_search method
   describe "#binary_search" do
     it "searches AddressBook for a non-existent entry" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Dan")
       expect(entry).to be_nil
     end
     it "searches AddressBook for Bill" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Bill")
       expect(entry).to be_a Entry
       check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
     end
     
     it "searches AddressBook for Bob" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Bob")
       expect(entry).to be_a Entry
       check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
     end
 
     it "searches AddressBook for Joe" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Joe")
       expect(entry).to be_a Entry
       check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
     end
 
     it "searches AddressBook for Sally" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Sally")
       expect(entry).to be_a Entry
       check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
     end
 
     it "searches AddressBook for Sussie" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Sussie")
       expect(entry).to be_a Entry
       check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
     
     it "searches AddressBook for Billy" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Billy")
       expect(entry).to be_nil
     end
   end
end
 
class Book < ActiveRecord::Base
attr_accessible :author, :borrower_id, :id, :owner_id, :title, :b_id, :image_url

# make a migration that adds:
  # b_id - book id (string)		
  # image_url - string

# when someone clicks 'Add to my library',
  # Send the b_id in a form (hidden field)
  # in a controller action, read that book id
  # and do an API call to get the book info
  # then make a new 'book' model, and populate it
  # with: user, title, author, image_url, book id
  # Save it!
  #
  # The book will now be in the user's library.

  #...then...
  # make a page to display all @user.books for a given user

belongs_to :owner, :class_name => "User" 
#belongs_to :borrower, :class_name => "User"
def borrower
User.find_by_id(self.id)
end


# validate :borrower_is_not_owner

# private

# def :borrower_is_not_owner
# 	if borrower == owner
# 		errors.add(:borrower, "cannot be the same as the owner_id")
#end
end
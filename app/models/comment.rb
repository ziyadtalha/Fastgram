class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #text should not be null
  validates :text, presence: true

  #update username on paste whenever user changes their name
  # def update_username(name)
  #   if self.update_attribute(:username, name)
  #     puts "Success!"
  #   else
  #     puts "Failed to update record. Handle the error."
  #   end
  # end

end

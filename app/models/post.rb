class Post < ApplicationRecord
  belongs_to :user

  has_many_attached :images, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  #caption should not be null
  validates :caption, presence: true


  #max 5 images per post
  validate :validate_images

  #update username on paste whenever user changes their name
  # def update_username(name)
  #   if self.update_attribute(:username, name)
  #     puts "Success!"
  #   else
  #    puts "Failed to update record. Handle the error."
  #   end
  # end

  private
  def validate_images
    return if images.count <= 5

    errors.add(:images, 'You can upload max 5 images')
  end

end

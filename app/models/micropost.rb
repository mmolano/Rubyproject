class Micropost < ApplicationRecord
  belongs_to :utilisateur
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :utilisateur_id, presence: true
  validates :content, presence: true, length: { maximum: 180 }
  validate :picture_size

  private

  def picture_size
    if picture.size > 1.megabytes
      errors.add(:picture, "doit être inférieur à 1MB")
    end
  end
end

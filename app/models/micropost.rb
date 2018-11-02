class Micropost < ApplicationRecord
  belongs_to :utilisateur
  validates :utilisateur_id, presence: true
  validates :content, presence: true, lenght: {maximum: 180}
end

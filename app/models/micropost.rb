class Micropost < ApplicationRecord
  belongs_to :utilisateur
  default_scope -> { order(created_at: :desc) }
  validates :utilisateur_id, presence: true
  validates :content, presence: true, length: { maximum: 180 }
end

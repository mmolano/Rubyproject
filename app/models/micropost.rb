class Micropost < ApplicationRecord
  belongs_to :utilisateur
  default_scope -> {order(created_at: :desc)}
  validates :utilisateur_id, presence: true
  validates :content, presence: true, lenght: {maximum: 180}
end

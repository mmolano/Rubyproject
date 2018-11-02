class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'Utilisateur'
  belongs_to :followed, class_name: 'Utilisateur'
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end

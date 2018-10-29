class Utilisateur < ApplicationRecord

  before_save { self.email = email.downcase }
  validates :nom, presence: true, length: {maximum: 50}
  VALIDE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, 
            format: {with: VALIDE_EMAIL_REGEX}, uniqueness: {case_sensitive: false}


end

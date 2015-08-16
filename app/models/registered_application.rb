class RegisteredApplication < ActiveRecord::Base
  belongs_to :user


  validates :name, presence: true, length: { minimum: 4 }
  validates :url, presence: true, length: { minimum: 5 }, uniqueness: { case_sensitive: false }
  validates :user, presence: true

  
end

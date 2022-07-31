class Book < ApplicationRecord
    belongs_to :genre, class_name: "Genre", foreign_key: "genre_id"
    has_many :borrowings, class_name: "borrowing", foreign_key: "reference_id"
    
    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :author, presence: true
    validates :published_year, presence: true
    validates :copies, presence: true
    validates :genre_id, presence: true
end

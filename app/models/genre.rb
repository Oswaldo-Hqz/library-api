class Genre < ApplicationRecord
    has_many :books, class_name: "book", foreign_key: "reference_id"

    validates :genre_name, presence: true, uniqueness: { case_sensitive: false }
end

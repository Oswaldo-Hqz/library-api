class Borrowing < ApplicationRecord
    belongs_to :book, class_name: "Book", foreign_key: "book_id"
    belongs_to :user, class_name: "User", foreign_key: "user_id"

    validates :book_id, presence: true
    validates :user_id, presence: true
    validates :release_date, presence: true   
    
end

class Role < ApplicationRecord
    has_many :users, class_name: "user", foreign_key: "reference_id"

    validates :role_name, presence: true, uniqueness: { case_sensitive: false }    
end

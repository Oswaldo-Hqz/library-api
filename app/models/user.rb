class User < ApplicationRecord
    belongs_to :role, class_name: "Role", foreign_key: "role_id"
    has_many :borrowings, class_name: "borrowing", foreign_key: "reference_id"

    require "securerandom"
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum:6}
    
end

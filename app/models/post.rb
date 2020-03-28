class Post < ApplicationRecord
    validates :title , :content , presence: true
    validates :title , length: { maximum: 50 } , uniqueness: true

    has_many :comments
end

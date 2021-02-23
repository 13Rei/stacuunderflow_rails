class Post < ApplicationRecord
    belongs_to :user
    acts_as_taggable
    has_many :comments, :dependent => :destroy
end
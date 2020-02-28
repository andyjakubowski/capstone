class Space < ApplicationRecord
  has_many :lists, dependent: :destroy
end

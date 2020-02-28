class List < ApplicationRecord
  has_many :tokens, dependent: :destroy
  belongs_to :space
end

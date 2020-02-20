class Category < ApplicationRecord
  has_many :tokens, dependent: :nullify
end

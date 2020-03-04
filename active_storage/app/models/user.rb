class User < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :motto
end

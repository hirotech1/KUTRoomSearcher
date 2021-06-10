class User < ApplicationRecord
  has_secure_password
  validates :name, {presence: true, uniqueness: true}
  validates :password ,length:{minimum:8},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
end

class Channel < ApplicationRecord
  has_many :discussions
  has_many :contributors
  has_many :users, through: :contributors
end
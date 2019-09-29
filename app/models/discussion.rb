# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user
  has_many :replies
  belongs_to :channel
end

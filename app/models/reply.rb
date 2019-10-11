# frozen_string_literal: true

class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
end

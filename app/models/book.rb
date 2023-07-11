# frozen_string_literal: true

require_relative 'item'

# Class than handles book creation
class Book < Item
  attr_accessor :publisher, :cover_state

  # TODO: check remaining attributes missing
  def initialize_additional_info(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    # Implement the logic for determining if the book can be archived
    # Return true or false based on the conditions
  end
end

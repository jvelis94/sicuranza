class Punchlistitem < ApplicationRecord
  belongs_to :jobpunchlist

  def completed?
    !completed_at.blank?
  end
  
end

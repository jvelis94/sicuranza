class WorkOrder < ApplicationRecord
    belongs_to :user
    has_one :invoice
end

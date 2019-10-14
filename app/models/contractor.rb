class Contractor < ApplicationRecord
    has_many_attached :files
    has_many_attached :blueprints
end

class Jobpunchlist < ApplicationRecord
    has_many :punchlistitems, dependent: :destroy

end

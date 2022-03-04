class Company < ApplicationRecord
    has_many :user
    paginates_per 5
end

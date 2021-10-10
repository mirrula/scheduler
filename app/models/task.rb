class Task < ApplicationRecord
    belongs_to :list
    validates :title, :body, presence:true
end

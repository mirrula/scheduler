class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 4..16 }

  has_many :events
  has_many :lists
  has_many :tasks, -> { where('status = false').order(list_id: :desc) }, class_name: 'Task', foreign_key: :author_id
  has_many :done_tasks, lambda {
                          where('status = true').order(list_id: :desc)
                        }, class_name: 'Task', foreign_key: :author_id
  has_many :general_tasks, lambda {
                             where('list_id IS NULL AND status = false').order(list_id: :desc)
                           }, class_name: 'Task', foreign_key: :author_id
end

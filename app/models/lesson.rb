class Lesson < ActiveRecord::Base
  belongs_to :section
  validates :title, :presence => true
  validates :content, :presence => true
end

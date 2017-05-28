class Subject < ApplicationRecord

  has_many :pages

  #scopes are essentially custom query methods used by the class
  scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"])}

  # long form
  # validates_presence_of :name
  # validates_length_of   :name, maximum: 255

  validates :name, presence: true,
                   length:   { maximum: 255 }

end

class Cat < ActiveRecord::Base
  COLORS = [
    "white",
    "grey",
    "black",
    "orange",
    "spotted"
  ]

  validates :birth_date, :color, :name, :sex, :description,
            presence: true

  validates :color, inclusion: COLORS
  validates :sex, inclusion: ["M", "F"]
  before_save :set_age
  has_many :cat_rental_requests

  def find_age
    now = Date.today
    now.year - birth_date.year - ((now.month > birth_date.month ||
      (now.month == birth_date.month && now.day >= birth_date.day)) ?
        0 : 1)
  end

  def set_age
    self[:age] = find_age
  end
end

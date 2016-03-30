class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: ["PENDING", "APPROVED", "DENIED"]
  validates :overlapping_approved_requests

  belongs_to :cat, dependent: :destroy

  private

  def overlapping_requests
    # CatRentalRequest
    #
    #   SELECT
    #     c1.cat_id
    #   FROM
    #     cat_rental_requests AS c1
    #   JOIN
    #     cat_rental_requests AS c2 ON c1.cat_id = c2.cat_id
    #   WHERE

  end

  def overlapping_approved_requests
  end

end

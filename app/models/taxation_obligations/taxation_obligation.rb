module TaxationObligations
  class TaxationObligation < ApplicationRecord
    belongs_to :taxation_form
    belongs_to :activity_type
  end
end

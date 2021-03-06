# frozen_string_literal: true

class TaxesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @taxes = wrapped_taxes
  end

  private

  def wrapped_taxes
    current_user.taxes.includes(:organization, taxation_form: :calculation_forms).map do |tax|
      TaxesBuilderPresenter.new(tax)
    end
  end
end

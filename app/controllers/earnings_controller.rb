class EarningsController < ApplicationController
  before_action :employer
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
    @earnings = @employer.earnings.all
  end

  def upload
    Earning.upload(params[:file].path, @employer)

    redirect_to show_all_earnings_path(@employer.id)
  end
end

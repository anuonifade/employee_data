class ApplicationController < ActionController::Base

  private

  def employer
    @employer = Employer.find(params[:id])
  end
end

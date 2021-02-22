class EmployersController < ApplicationController
  before_action :employer, only: [:edit]

  def index
    @employers = Employer.all
  end

  def edit
  end

  def update
  end
end

class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    render text: "Invalid" unless current_admin?
  end
end
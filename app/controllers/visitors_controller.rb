class VisitorsController < ApplicationController
  expose(:projects) { Project.order(:name).page(params[:page]) }

  def index
  end
end

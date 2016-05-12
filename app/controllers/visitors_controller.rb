class VisitorsController < ApplicationController
  expose(:projects) { Project.order(:name) }

  def index
  end
end

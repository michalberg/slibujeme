class Api::V1::PartiesController < Api::V1::BaseController
  def index
    respond_with(Party.all)
  end
end
class ExecutivesController < ApplicationController
  def index
    @executives = Member.where.not(executive_id: nil)
  end
end

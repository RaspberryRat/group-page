class SubgroupsController < ApplicationController

  def index
    @subgroups = Subgroup.all
  end

  def show
    @subgroup = Subgroup.find(params[:id])
  end
end

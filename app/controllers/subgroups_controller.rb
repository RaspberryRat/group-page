class SubgroupsController < ApplicationController

  def index
    @subgroups = Subgroup.all
  end
end

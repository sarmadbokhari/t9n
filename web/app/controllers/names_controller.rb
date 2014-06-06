class NamesController < ApplicationController
  def index
    @names = The99Names.db.list_names
  end

  def show
    @name = The99Names.db.get_name(params[:id])
  end

  def edit
  end

  def update
  end
end

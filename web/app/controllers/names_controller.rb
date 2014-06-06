class NamesController < ApplicationController
  def index
    @names = The99Names.db.list_names
  end

  def show

  end

  def edit
  end

  def update
  end
end

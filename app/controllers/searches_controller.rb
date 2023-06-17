class SearchesController < ApplicationController
  before_action  :authenticate_user!

  def search
    @range = params[:range]
  end
end

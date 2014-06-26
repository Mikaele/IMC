class IndexController < ApplicationController
  def index
    if(!current_user)
      redirect_to 'sign_in'
    end
  end
end

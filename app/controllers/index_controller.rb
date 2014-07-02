class IndexController < ApplicationController
  def index
    if(!current_user)
      redirect_to '/sign_in'
    else
      if !current_user.colaborador && !current_user.client
        @cliente=Client.create(:user_id=>current_user.id)
      end
    end
  end
end

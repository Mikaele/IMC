class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
   super
  end
  def after_sign_in_path_for(resource)
    if !current_user.colaborador && !current_user.client
      @cliente=Client.create(:user_id=>current_user.id)
    end
  end
end
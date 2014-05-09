module UsersHelper

  def check_user  #checks current user and allows them to only see their own account.
    if current_user.nil? || (current_user.id.to_s != params[:id])
      flash[:error] = "That's not your account."
      redirect_to current_user
    end
  end
  
end

module UsersHelper
  def check_user
   # binding.pry
    # user = current_user
    if current_user.nil? || (current_user.id.to_s != params[:id])
      flash[:error] = "That's not your account."
      redirect_to current_user
    end
  end
end

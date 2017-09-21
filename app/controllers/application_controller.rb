class ApplicationController < ActionController::Base
  check_authorization unless: :devise_controller?
  protect_from_forgery with: :exception
  before_action :save_guest_user

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

   # if user is logged in, return current_user, else return guest_user
   def current_or_guest_user
    if current_user
      if session[:guest_authentication_token] &&
        !current_user.matches_guest_authentication_token?(session[:guest_authentication_token])
        # transfer_guest_to_current_user
        guest_user(with_retry = false).try(:destroy)
        session[:guest_authentication_token] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # Find guest_user object associated with the current session,
  # Creating one as needed
  def guest_user(with_retry = true)
    begin
      # Cache the value the first time it's gotten.
      @cached_guest_user ||=User.find_by_guest_authentication_token(session[:guest_authentication_token]) ||User.build_guest(session)
    rescue ActiveRecord::RecordNotFound
      session[:guest_authentication_token] = nil
      guest_user if with_retry
    end
  end

  protected

  def save_guest_user
    current_or_guest_user.save
  end

  def current_ability
    @current_ability ||= Ability.new(current_or_guest_user, params)
  end

  # def transfer_guest_to_current_user
  #   logging_guest_user = guest_user(with_retry = false)
  #   if logging_guest_user
  #     logging_guest_user.takes.update_all(taker_id: current_user.id)
  #   end
  # end
end

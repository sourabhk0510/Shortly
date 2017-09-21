class Ability
  include CanCan::Ability

  def initialize(user, params = {})
    @user = user || User.new
    @params = params
    if @user.role.present?
      send(@user.role)
    else
      anonymous
    end
  end

  def admin
    can :manage, :all
  end

  def guest
    cannot :manage, :all
    can [:index,:create,:go], Link
  end
end

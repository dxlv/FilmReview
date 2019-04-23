# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
       user ||= User.new # guest user (not logged in)
       if user.admin?
         can :manage, :all
       elsif user.editor?
         can :update, Film
         can :manage, Review

       else
         can :manage, Film, user_id: user.id
         can :manage, Review, user_id: user.id
         can :read, :all
       end
  end
end

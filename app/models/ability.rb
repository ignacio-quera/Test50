# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :read, :all
    if user.administrador?
      can :create, Product
      can :manage, :all
    end
  end
end

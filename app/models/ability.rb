class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Expense, author: user
    can :manage, Group, user_id: user.id
  end
end

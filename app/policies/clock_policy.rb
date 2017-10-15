class ClockPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.public?
  end

  def update?
    if record.user_id.blank?
      false
    else
      record.user_id == user.try(:id)
    end
  end

  def destroy?
    if record.user_id.blank?
      false
    else
      record.user_id == user.id
    end
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end

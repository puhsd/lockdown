class LockPolicy < ApplicationPolicy

  class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user  = user
        @scope = scope
      end

      def resolve
        if user.admin?
          scope.all
        else
          scope.where(user_id: user.id)
        end
      end
  end

  def show?
    # scope.where(:id => record.id).exists? unless user.admin?
    # true
    user.id == record.user_id || user.admin?
  end

  def edit?
    user.id == record.user_id || user.admin?
  end

  def new?
    !user.student?
  end

  def create?
    new?
  end

  def destroy?
     user.admin?
  end


end

class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    pundit_user.present?
  end

  def update?
    return true if pundit_user.present? && pundit_user == rent.user_id
  end

  def destroy?
    return true if pundit_user.present? && pundit_user == rent.user_id
  end

  private

  def rent
    record
  end
end

module ApplicationHelper
  def admin?
    params[:admin].present?
  end
end

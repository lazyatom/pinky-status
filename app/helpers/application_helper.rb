module ApplicationHelper
  def admin?
    params[:admin].present?
  end

  def arrow(status)
    if status == "in"
      content_tag(:i, "", class: %w(icon icon-arrow-left))
    else
      content_tag(:i, "", class: %w(icon icon-arrow-right))
    end
  end
end

module RequestsHelper
  def select_request_badge_color(status)
    case status
    when "pending"
      return "badge-warning"
    when "approved"
      return "badge-success"
    when "declined"
      return "badge-danger"
    end
  end
end

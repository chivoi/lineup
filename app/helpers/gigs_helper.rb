module GigsHelper
  def select_badge_color(style_id)
    if style_id % 3 == 0
      return "badge-primary"
    elsif style_id % 2 == 0
      return "badge-dark"
    else
      return "badge-info"
    end
  end
end

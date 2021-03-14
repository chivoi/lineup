module GigsHelper
  def select_badge_color(style_id)
    if style_id % 3 == 0
      return "badge-yellow"
    elsif style_id % 2 == 0
      return "badge-black"
    else
      return "badge-red"
    end
  end
end

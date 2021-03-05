module ApplicationHelper
  def icon(icon, options = {})
    file = File.read("node_modules/bootstrap-icons/icons/#{icon}.svg")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] += " " + options[:class]
    end
      doc.to_html.html_safe
  end

  def convert_price_to_dollars(price)
    number_with_precision price/100, precision: 2
  end

  def select_alert_subclass(input)
    case input
    when 'notice'
      return 'info'
    when 'success'
      return 'success'
    when 'error'
      return 'danger'
    when 'alert'
      return 'warning'
    else 
      return 'warning'
    end
  end

end

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

  def emojify(content)
    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
        %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
      else
        match
      end
    end.html_safe if content.present?
  end
end

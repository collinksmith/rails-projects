module ApplicationHelper
  def auth_token
    html = <<-HTML
    <input type="hidden" 
           name="authenticity_token"
           value="#{form_authenticity_token}">
    HTML

    html.html_safe
  end

  def method_type(type)
    html = <<-HTML
    <input type="hidden"
           name="_method"
           value="#{type}">
    HTML

    html.html_safe
  end

  def nav_link(text, url, method=:get)
    if method == :get
      link = link_to text, url
    else
      link = link_to text, url, method: method
    end

    html = <<-HTML
    <li role="presentation" #{"class='active'" if request.original_url == url}>
      #{link}
    </li>
    HTML

    html.html_safe
  end
end

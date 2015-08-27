module ApplicationHelper
  include ERB::Util

  def auth_token
    html = <<-HTML
    <input type='hidden'
           name='authenticity_token'
           value='#{form_authenticity_token}'>
    HTML

    html.html_safe
  end

  def method_hack(method_type)
    html = <<-HTML
    <input type='hidden'
           name='_method'
           value='#{method_type}'>
    HTML

    html.html_safe
  end

  def ugly_lyrics(lyrics)
    lyrics = lyrics.split("\n")
    lyrics.map! { |line| "&#9835" + h(line) }

    html = "<pre>#{lyrics.join("\n")}</pre>"
    html.html_safe
  end
end

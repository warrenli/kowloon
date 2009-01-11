# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << content_tag(:div, html_escape(flash[msg.to_sym]), :id => "flash-#{msg}") unless flash[msg.to_sym].blank?
    end
    messages
  end

  def locale_link(locale, locale_desc)
     locale_text = "#{locale_desc} (#{locale})"
     options =  { :locale => "#{locale}" }
     if I18n.locale == locale
       "#{locale_desc} (#{locale})"
     else
       link_to locale_text,
       url_for( {:controller => self.controller_name, :action => self.action_name}.merge(options) )
     end
  end
end

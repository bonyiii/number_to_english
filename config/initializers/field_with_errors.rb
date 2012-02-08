ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /<(input|select|textarea)/
    "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
  else
    html_tag.html_safe
  end
end

=begin
# http://snippets.dzone.com/tag/field_error_proc
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  error_style = "background-color: #ffff80"
  if html_tag =~ /<(input|textarea|select)[^>]+style=/
    style_attribute = html_tag =~ /style=['"]/
    html_tag.insert(style_attribute + 7, "#{error_style}; ")
  elsif html_tag =~ /<(input|textarea|select)/
    first_whitespace = html_tag =~ /\s/
    html_tag[first_whitespace] = " style='#{error_style}' "
  end
  html_tag
end
=end
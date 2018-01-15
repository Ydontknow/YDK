module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <script>
    var $toastContent = $("<ul class='devise-error'>#{messages}</ul>");
    Materialize.toast($toastContent, 6000);
    </script>
    HTML

    html.html_safe
  end
end

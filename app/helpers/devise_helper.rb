module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    errors = resource.errors.full_messages.map do |msg|
      html = <<-HTML
      <script type="text/javascript">Materialize.toast("#{msg}", 6000, 'devise-error');</script>
      HTML
    end
    errors.join.html_safe
  end
end

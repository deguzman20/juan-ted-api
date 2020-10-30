class TaskerFormBuilder < ActionView::Helpers::FormBuilder
  %w[text].each do |method_name|
    define_method("#{method_name}_field") do |name, *args|
      @template.content_tag(:div, class: "col-md-6 col-lg-6") do
        super(name, *args, class: "form-control", name: name.to_s, required: "required", placeholder: name.capitalize.to_s.tr("_", " ").to_s) +
          @template.tag(:br)
      end
    end
  end
end

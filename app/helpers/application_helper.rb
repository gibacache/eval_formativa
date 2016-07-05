module ApplicationHelper

  def controller_class
    controller_path.classify.constantize
  end

  def index_title
    content_tag :h1, "Tabla #{controller_class.model_name.human}"
  end

  def new_title
    content_tag :h1, "Crear #{controller_class.model_name.human}"
  end

  def edit_title
    content_tag :h1, "Editando #{controller_class.model_name.human}"
  end

  def object_edit_path(object)
    send "edit_#{object.class.name.underscore}_path", object
  end

  def link_to_new_path
    link_to "+ #{t(:new, scope: 'site')} #{controller_class.model_name.human}", send("new_#{controller_class.name.underscore}_path"), class: 'btn btn-default'
  end
end

module AdminHelper

  def action_methods
    tab_name = controller_name.classify
    puts "------------#{tab_name}"
    if current_admin_user.present?
      if current_admin_user.write_allowed?(tab_name)
        super
      elsif current_admin_user.show_tab?(tab_name)
        super - ['edit', 'new', 'create', 'destroy']
      else
        []
      end
    else
      super
    end
  end

end

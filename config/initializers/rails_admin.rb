RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.model 'ArgumentativeQuestion' do
    object_label_method do
      :question
    end
    list do
      include_fields :id, :question, :feedback_wrong_argument, :feedback_wrong, :correct_answer, :correct_argument, :nodes
      include_all_fields
    end
  end

  config.model 'Node' do
    object_label_method do
      :label
    end
    list do
      include_fields :id, :label, :tree, :questionable
      include_all_fields
    end
  end

  config.model 'Tree' do
    object_label_method do
      :label
    end
    list do
      include_fields :id, :label, :first_node, :n_repeat
      include_all_fields
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

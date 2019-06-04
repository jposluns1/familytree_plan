Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "connections#index"
  # Routes for the Relationship list resource:

  # CREATE
  get("/relationship_lists/new", { :controller => "relationship_lists", :action => "new_form" })
  post("/create_relationship_list", { :controller => "relationship_lists", :action => "create_row" })

  # READ
  get("/relationship_lists", { :controller => "relationship_lists", :action => "index" })
  get("/relationship_lists/:id_to_display", { :controller => "relationship_lists", :action => "show" })

  # UPDATE
  get("/relationship_lists/:prefill_with_id/edit", { :controller => "relationship_lists", :action => "edit_form" })
  post("/update_relationship_list/:id_to_modify", { :controller => "relationship_lists", :action => "update_row" })

  # DELETE
  get("/delete_relationship_list/:id_to_remove", { :controller => "relationship_lists", :action => "destroy_row" })

  #------------------------------

  # Routes for the Note resource:

  # CREATE
  get("/notes/new", { :controller => "notes", :action => "new_form" })
  post("/create_note", { :controller => "notes", :action => "create_row" })

  # READ
  get("/notes", { :controller => "notes", :action => "index" })
  get("/notes/:id_to_display", { :controller => "notes", :action => "show" })

  # UPDATE
  get("/notes/:prefill_with_id/edit", { :controller => "notes", :action => "edit_form" })
  post("/update_note/:id_to_modify", { :controller => "notes", :action => "update_row" })

  # DELETE
  get("/delete_note/:id_to_remove", { :controller => "notes", :action => "destroy_row" })
  get("/delete_note_from_connection/:id_to_remove", { :controller => "notes", :action => "destroy_row_from_connection" })
  get("/delete_note_from_user/:id_to_remove", { :controller => "notes", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Connection resource:

  # CREATE
  get("/connections/new", { :controller => "connections", :action => "new_form" })
  post("/create_connection", { :controller => "connections", :action => "create_row" })

  # READ
  get("/connections", { :controller => "connections", :action => "index" })
  get("/connections/:id_to_display", { :controller => "connections", :action => "show" })

  # UPDATE
  get("/connections/:prefill_with_id/edit", { :controller => "connections", :action => "edit_form" })
  post("/update_connection/:id_to_modify", { :controller => "connections", :action => "update_row" })

  # DELETE
  get("/delete_connection/:id_to_remove", { :controller => "connections", :action => "destroy_row" })
  get("/delete_connection_from_user/:id_to_remove", { :controller => "connections", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

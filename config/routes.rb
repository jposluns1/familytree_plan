Rails.application.routes.draw do
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

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

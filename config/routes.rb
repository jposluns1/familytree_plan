Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "members#index"
  # Routes for the Family member match resource:

  # CREATE
  get("/family_member_matches/new", { :controller => "family_member_matches", :action => "new_form" })
  post("/create_family_member_match", { :controller => "family_member_matches", :action => "create_row" })
  post("/create_family_member_match_from_family", { :controller => "family_member_matches", :action => "create_row_from_family" })
  post("/create_family_member_match_from_member", { :controller => "family_member_matches", :action => "create_row_from_member" })

  # READ
  get("/family_member_matches", { :controller => "family_member_matches", :action => "index" })
  get("/family_member_matches/:id_to_display", { :controller => "family_member_matches", :action => "show" })

  # UPDATE
  get("/family_member_matches/:prefill_with_id/edit", { :controller => "family_member_matches", :action => "edit_form" })
  post("/update_family_member_match/:id_to_modify", { :controller => "family_member_matches", :action => "update_row" })

  # DELETE
  get("/delete_family_member_match/:id_to_remove", { :controller => "family_member_matches", :action => "destroy_row" })
  get("/delete_family_member_match_from_family/:id_to_remove", { :controller => "family_member_matches", :action => "destroy_row_from_family" })
  get("/delete_family_member_match_from_member/:id_to_remove", { :controller => "family_member_matches", :action => "destroy_row_from_member" })

  #------------------------------

  # Routes for the Family resource:

  # CREATE
  get("/families/new", { :controller => "families", :action => "new_form" })
  post("/create_family", { :controller => "families", :action => "create_row" })

  # READ
  get("/families", { :controller => "families", :action => "index" })
  get("/families/:id_to_display", { :controller => "families", :action => "show" })

  # UPDATE
  get("/families/:prefill_with_id/edit", { :controller => "families", :action => "edit_form" })
  post("/update_family/:id_to_modify", { :controller => "families", :action => "update_row" })

  # DELETE
  get("/delete_family/:id_to_remove", { :controller => "families", :action => "destroy_row" })
  get("/delete_family_from_user/:id_to_remove", { :controller => "families", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Partner match resource:

  # CREATE
  get("/partner_matches/new", { :controller => "partner_matches", :action => "new_form" })
  post("/create_partner_match", { :controller => "partner_matches", :action => "create_row" })

  # READ
  get("/partner_matches", { :controller => "partner_matches", :action => "index" })
  get("/partner_matches/:id_to_display", { :controller => "partner_matches", :action => "show" })

  # UPDATE
  get("/partner_matches/:prefill_with_id/edit", { :controller => "partner_matches", :action => "edit_form" })
  post("/update_partner_match/:id_to_modify", { :controller => "partner_matches", :action => "update_row" })

  # DELETE
  get("/delete_partner_match/:id_to_remove", { :controller => "partner_matches", :action => "destroy_row" })

  #------------------------------

  # Routes for the Note resource:

  # CREATE
  get("/notes/new", { :controller => "notes", :action => "new_form" })
  post("/create_note", { :controller => "notes", :action => "create_row" })
  post("/create_note_from_member", { :controller => "notes", :action => "create_row_from_member" })

  # READ
  get("/notes", { :controller => "notes", :action => "index" })
  get("/notes/:id_to_display", { :controller => "notes", :action => "show" })

  # UPDATE
  get("/notes/:prefill_with_id/edit", { :controller => "notes", :action => "edit_form" })
  post("/update_note/:id_to_modify", { :controller => "notes", :action => "update_row" })

  # DELETE
  get("/delete_note/:id_to_remove", { :controller => "notes", :action => "destroy_row" })
  get("/delete_note_from_member/:id_to_remove", { :controller => "notes", :action => "destroy_row_from_member" })
  get("/delete_note_from_user/:id_to_remove", { :controller => "notes", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Member resource:

  # CREATE
  get("/members/new", { :controller => "members", :action => "new_form" })
  post("/create_member", { :controller => "members", :action => "create_row" })

  # READ
  get("/members", { :controller => "members", :action => "index" })
  get("/members/:id_to_display", { :controller => "members", :action => "show" })

  # UPDATE
  get("/members/:prefill_with_id/edit", { :controller => "members", :action => "edit_form" })
  post("/update_member/:id_to_modify", { :controller => "members", :action => "update_row" })

  # DELETE
  get("/delete_member/:id_to_remove", { :controller => "members", :action => "destroy_row" })
  get("/delete_member_from_user/:id_to_remove", { :controller => "members", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

class NotesController < ApplicationController
  before_action :current_user_must_be_note_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_note_user
    note = Note.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == note.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.notes.ransack(params[:q])
    @notes = @q.result(:distinct => true).includes(:user, :member).page(params[:page]).per(10)

    render("note_templates/index.html.erb")
  end

  def show
    @note = Note.find(params.fetch("id_to_display"))

    render("note_templates/show.html.erb")
  end

  def new_form
    @note = Note.new

    render("note_templates/new_form.html.erb")
  end

  def create_row
    @note = Note.new

    @note.body = params.fetch("body")
    @note.member_id = params.fetch("member_id")
    @note.user_id = params.fetch("user_id")

    if @note.valid?
      @note.save

      redirect_back(:fallback_location => "/notes", :notice => "Note created successfully.")
    else
      render("note_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_member
    @note = Note.new

    @note.body = params.fetch("body")
    @note.member_id = params.fetch("member_id")
    @note.user_id = params.fetch("user_id")

    if @note.valid?
      @note.save

      redirect_to("/members/#{@note.member_id}", notice: "Note created successfully.")
    else
      render("note_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @note = Note.find(params.fetch("prefill_with_id"))

    render("note_templates/edit_form.html.erb")
  end

  def update_row
    @note = Note.find(params.fetch("id_to_modify"))

    @note.body = params.fetch("body")
    @note.member_id = params.fetch("member_id")
    

    if @note.valid?
      @note.save

      redirect_to("/notes/#{@note.id}", :notice => "Note updated successfully.")
    else
      render("note_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @note = Note.find(params.fetch("id_to_remove"))

    @note.destroy

    redirect_to("/users/#{@note.user_id}", notice: "Note deleted successfully.")
  end

  def destroy_row_from_member
    @note = Note.find(params.fetch("id_to_remove"))

    @note.destroy

    redirect_to("/members/#{@note.member_id}", notice: "Note deleted successfully.")
  end

  def destroy_row
    @note = Note.find(params.fetch("id_to_remove"))

    @note.destroy

    redirect_to("/notes", :notice => "Note deleted successfully.")
  end
end

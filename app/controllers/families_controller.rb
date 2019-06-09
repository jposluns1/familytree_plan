class FamiliesController < ApplicationController
  before_action :current_user_must_be_family_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_family_user
    family = Family.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == family.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.families.ransack(params[:q])
    @families = @q.result(:distinct => true).includes(:user, :family_member_matches).page(params[:page]).per(10)

    render("family_templates/index.html.erb")
  end

  def show
    @family_member_match = FamilyMemberMatch.new
    @family = Family.find(params.fetch("id_to_display"))

    render("family_templates/show.html.erb")
  end

  def new_form
    @family = Family.new

    render("family_templates/new_form.html.erb")
  end

  def create_row
    @family = Family.new

    @family.family_name = params.fetch("family_name")
    @family.family_description = params.fetch("family_description")
    @family.user_id = params.fetch("user_id")

    if @family.valid?
      @family.save

      redirect_back(:fallback_location => "/families", :notice => "Family created successfully.")
    else
      render("family_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @family = Family.find(params.fetch("prefill_with_id"))

    render("family_templates/edit_form.html.erb")
  end

  def update_row
    @family = Family.find(params.fetch("id_to_modify"))

    @family.family_name = params.fetch("family_name")
    @family.family_description = params.fetch("family_description")
    

    if @family.valid?
      @family.save

      redirect_to("/families/#{@family.id}", :notice => "Family updated successfully.")
    else
      render("family_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @family = Family.find(params.fetch("id_to_remove"))

    @family.destroy

    redirect_to("/users/#{@family.user_id}", notice: "Family deleted successfully.")
  end

  def destroy_row
    @family = Family.find(params.fetch("id_to_remove"))

    @family.destroy

    redirect_to("/families", :notice => "Family deleted successfully.")
  end
end

class MembersController < ApplicationController
  before_action :current_user_must_be_member_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_member_user
    member = Member.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == member.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.members.ransack(params[:q])
    @members = @q.result(:distinct => true).includes(:user, :notes, :partner_1, :partner_2, :family_member_matches).page(params[:page]).per(10)

    render("member_templates/index.html.erb")
  end

  def show
    @family_member_match = FamilyMemberMatch.new
    @note = Note.new
    @member = Member.find(params.fetch("id_to_display"))

    render("member_templates/show.html.erb")
  end

  def new_form
    @member = Member.new

    render("member_templates/new_form.html.erb")
  end

  def create_row
    @member = Member.new

    @member.user_id = params.fetch("user_id")
    @member.first_name = params.fetch("first_name")
    @member.last_name = params.fetch("last_name")
    @member.relationship_description = params.fetch("relationship_description")
    @member.birth_month = params.fetch("birth_month")
    @member.birth_day = params.fetch("birth_day")
    @member.birth_year = params.fetch("birth_year")
    @member.gender = params.fetch("gender")
    @member.location = params.fetch("location")
    @member.anniversary_month = params.fetch("anniversary_month")
    @member.anniversary_day = params.fetch("anniversary_day")
    @member.anniversary_year = params.fetch("anniversary_year")
    @member.passed = params.fetch("passed")
    @member.ex = params.fetch("ex")

    if @member.valid?
      @member.save

      redirect_back(:fallback_location => "/members", :notice => "Member created successfully.")
    else
      render("member_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @member = Member.find(params.fetch("prefill_with_id"))

    render("member_templates/edit_form.html.erb")
  end

  def update_row
    @member = Member.find(params.fetch("id_to_modify"))

    
    @member.first_name = params.fetch("first_name")
    @member.last_name = params.fetch("last_name")
    @member.relationship_description = params.fetch("relationship_description")
    @member.birth_month = params.fetch("birth_month")
    @member.birth_day = params.fetch("birth_day")
    @member.birth_year = params.fetch("birth_year")
    @member.gender = params.fetch("gender")
    @member.location = params.fetch("location")
    @member.anniversary_month = params.fetch("anniversary_month")
    @member.anniversary_day = params.fetch("anniversary_day")
    @member.anniversary_year = params.fetch("anniversary_year")
    @member.passed = params.fetch("passed")
    @member.ex = params.fetch("ex")

    if @member.valid?
      @member.save

      redirect_to("/members/#{@member.id}", :notice => "Member updated successfully.")
    else
      render("member_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @member = Member.find(params.fetch("id_to_remove"))

    @member.destroy

    redirect_to("/users/#{@member.user_id}", notice: "Member deleted successfully.")
  end

  def destroy_row
    @member = Member.find(params.fetch("id_to_remove"))

    @member.destroy

    redirect_to("/members", :notice => "Member deleted successfully.")
  end
end

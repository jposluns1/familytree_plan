class FamilyMemberMatchesController < ApplicationController
  def index
    @q = FamilyMemberMatch.ransack(params[:q])
    @family_member_matches = @q.result(:distinct => true).includes(:member, :family).page(params[:page]).per(10)

    render("family_member_match_templates/index.html.erb")
  end

  def show
    @family_member_match = FamilyMemberMatch.find(params.fetch("id_to_display"))

    render("family_member_match_templates/show.html.erb")
  end

  def new_form
    @family_member_match = FamilyMemberMatch.new

    render("family_member_match_templates/new_form.html.erb")
  end

  def create_row
    @family_member_match = FamilyMemberMatch.new

    @family_member_match.family_id = params.fetch("family_id")
    @family_member_match.member_id = params.fetch("member_id")
    @family_member_match.generation = params.fetch("generation")

    if @family_member_match.valid?
      @family_member_match.save

      redirect_back(:fallback_location => "/family_member_matches", :notice => "Family member match created successfully.")
    else
      render("family_member_match_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_member
    @family_member_match = FamilyMemberMatch.new

    @family_member_match.family_id = params.fetch("family_id")
    @family_member_match.member_id = params.fetch("member_id")
    @family_member_match.generation = params.fetch("generation")

    if @family_member_match.valid?
      @family_member_match.save

      redirect_to("/members/#{@family_member_match.member_id}", notice: "FamilyMemberMatch created successfully.")
    else
      render("family_member_match_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_family
    @family_member_match = FamilyMemberMatch.new

    @family_member_match.family_id = params.fetch("family_id")
    @family_member_match.member_id = params.fetch("member_id")
    @family_member_match.generation = params.fetch("generation")

    if @family_member_match.valid?
      @family_member_match.save

      redirect_to("/families/#{@family_member_match.family_id}", notice: "FamilyMemberMatch created successfully.")
    else
      render("family_member_match_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @family_member_match = FamilyMemberMatch.find(params.fetch("prefill_with_id"))

    render("family_member_match_templates/edit_form.html.erb")
  end

  def update_row
    @family_member_match = FamilyMemberMatch.find(params.fetch("id_to_modify"))

    @family_member_match.family_id = params.fetch("family_id")
    @family_member_match.member_id = params.fetch("member_id")
    @family_member_match.generation = params.fetch("generation")

    if @family_member_match.valid?
      @family_member_match.save

      redirect_to("/family_member_matches/#{@family_member_match.id}", :notice => "Family member match updated successfully.")
    else
      render("family_member_match_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_member
    @family_member_match = FamilyMemberMatch.find(params.fetch("id_to_remove"))

    @family_member_match.destroy

    redirect_to("/members/#{@family_member_match.member_id}", notice: "FamilyMemberMatch deleted successfully.")
  end

  def destroy_row_from_family
    @family_member_match = FamilyMemberMatch.find(params.fetch("id_to_remove"))

    @family_member_match.destroy

    redirect_to("/families/#{@family_member_match.family_id}", notice: "FamilyMemberMatch deleted successfully.")
  end

  def destroy_row
    @family_member_match = FamilyMemberMatch.find(params.fetch("id_to_remove"))

    @family_member_match.destroy

    redirect_to("/family_member_matches", :notice => "Family member match deleted successfully.")
  end
end

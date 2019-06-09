class PartnerMatchesController < ApplicationController
  def index
    @q = PartnerMatch.ransack(params[:q])
    @partner_matches = @q.result(:distinct => true).includes(:member, :member_2).page(params[:page]).per(10)

    render("partner_match_templates/index.html.erb")
  end

  def show
    @partner_match = PartnerMatch.find(params.fetch("id_to_display"))

    render("partner_match_templates/show.html.erb")
  end

  def new_form
    @partner_match = PartnerMatch.new

    render("partner_match_templates/new_form.html.erb")
  end

  def create_row
    @partner_match = PartnerMatch.new

    @partner_match.member_id_1 = params.fetch("member_id_1")
    @partner_match.member_id_2 = params.fetch("member_id_2")

    if @partner_match.valid?
      @partner_match.save

      redirect_back(:fallback_location => "/partner_matches", :notice => "Partner match created successfully.")
    else
      render("partner_match_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @partner_match = PartnerMatch.find(params.fetch("prefill_with_id"))

    render("partner_match_templates/edit_form.html.erb")
  end

  def update_row
    @partner_match = PartnerMatch.find(params.fetch("id_to_modify"))

    @partner_match.member_id_1 = params.fetch("member_id_1")
    @partner_match.member_id_2 = params.fetch("member_id_2")

    if @partner_match.valid?
      @partner_match.save

      redirect_to("/partner_matches/#{@partner_match.id}", :notice => "Partner match updated successfully.")
    else
      render("partner_match_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @partner_match = PartnerMatch.find(params.fetch("id_to_remove"))

    @partner_match.destroy

    redirect_to("/partner_matches", :notice => "Partner match deleted successfully.")
  end
end

class RelationshipListsController < ApplicationController
  def index
    @q = RelationshipList.ransack(params[:q])
    @relationship_lists = @q.result(:distinct => true).includes(:connection).page(params[:page]).per(10)

    render("relationship_list_templates/index.html.erb")
  end

  def show
    @relationship_list = RelationshipList.find(params.fetch("id_to_display"))

    render("relationship_list_templates/show.html.erb")
  end

  def new_form
    @relationship_list = RelationshipList.new

    render("relationship_list_templates/new_form.html.erb")
  end

  def create_row
    @relationship_list = RelationshipList.new

    @relationship_list.connection_id = params.fetch("connection_id")
    @relationship_list.mother_id = params.fetch("mother_id")
    @relationship_list.father_id = params.fetch("father_id")
    @relationship_list.child1_id = params.fetch("child1_id")
    @relationship_list.child2_id = params.fetch("child2_id")
    @relationship_list.child3_id = params.fetch("child3_id")
    @relationship_list.child4_id = params.fetch("child4_id")
    @relationship_list.child5_id = params.fetch("child5_id")
    @relationship_list.step_mother_id = params.fetch("step_mother_id")
    @relationship_list.step_father_id = params.fetch("step_father_id")
    @relationship_list.sibling1_id = params.fetch("sibling1_id")
    @relationship_list.sibling2_id = params.fetch("sibling2_id")
    @relationship_list.sibling3_id = params.fetch("sibling3_id")
    @relationship_list.sibling4_id = params.fetch("sibling4_id")
    @relationship_list.partner_id = params.fetch("partner_id")
    @relationship_list.husband_id = params.fetch("husband_id")
    @relationship_list.wife_id = params.fetch("wife_id")

    if @relationship_list.valid?
      @relationship_list.save

      redirect_back(:fallback_location => "/relationship_lists", :notice => "Relationship list created successfully.")
    else
      render("relationship_list_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @relationship_list = RelationshipList.find(params.fetch("prefill_with_id"))

    render("relationship_list_templates/edit_form.html.erb")
  end

  def update_row
    @relationship_list = RelationshipList.find(params.fetch("id_to_modify"))

    @relationship_list.connection_id = params.fetch("connection_id")
    @relationship_list.mother_id = params.fetch("mother_id")
    @relationship_list.father_id = params.fetch("father_id")
    @relationship_list.child1_id = params.fetch("child1_id")
    @relationship_list.child2_id = params.fetch("child2_id")
    @relationship_list.child3_id = params.fetch("child3_id")
    @relationship_list.child4_id = params.fetch("child4_id")
    @relationship_list.child5_id = params.fetch("child5_id")
    @relationship_list.step_mother_id = params.fetch("step_mother_id")
    @relationship_list.step_father_id = params.fetch("step_father_id")
    @relationship_list.sibling1_id = params.fetch("sibling1_id")
    @relationship_list.sibling2_id = params.fetch("sibling2_id")
    @relationship_list.sibling3_id = params.fetch("sibling3_id")
    @relationship_list.sibling4_id = params.fetch("sibling4_id")
    @relationship_list.partner_id = params.fetch("partner_id")
    @relationship_list.husband_id = params.fetch("husband_id")
    @relationship_list.wife_id = params.fetch("wife_id")

    if @relationship_list.valid?
      @relationship_list.save

      redirect_to("/relationship_lists/#{@relationship_list.id}", :notice => "Relationship list updated successfully.")
    else
      render("relationship_list_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @relationship_list = RelationshipList.find(params.fetch("id_to_remove"))

    @relationship_list.destroy

    redirect_to("/relationship_lists", :notice => "Relationship list deleted successfully.")
  end
end

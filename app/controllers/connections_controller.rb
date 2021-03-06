class ConnectionsController < ApplicationController
  before_action :current_user_must_be_connection_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_connection_user
    connection = Connection.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == connection.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.connections.ransack(params[:q])
    @connections = @q.result(:distinct => true).includes(:user, :notes, :relationship_list).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@connections.where.not(:location_latitude => nil)) do |connection, marker|
      marker.lat connection.location_latitude
      marker.lng connection.location_longitude
      marker.infowindow "<h5><a href='/connections/#{connection.id}'>#{connection.name}</a></h5><small>#{connection.location_formatted_address}</small>"
    end

    render("connection_templates/index.html.erb")
  end

  def show
    @note = Note.new
    @connection = Connection.find(params.fetch("id_to_display"))

    render("connection_templates/show.html.erb")
  end

  def new_form
    @connection = Connection.new

    render("connection_templates/new_form.html.erb")
  end

  def create_row
    @connection = Connection.new

    @connection.name = params.fetch("name")
    @connection.image = params.fetch("image") if params.key?("image")
    @connection.location = params.fetch("location")
    @connection.birthday = params.fetch("birthday")
    @connection.user_id = params.fetch("user_id")

    if @connection.valid?
      @connection.save

      redirect_back(:fallback_location => "/connections", :notice => "Connection created successfully.")
    else
      render("connection_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @connection = Connection.find(params.fetch("prefill_with_id"))

    render("connection_templates/edit_form.html.erb")
  end

  def update_row
    @connection = Connection.find(params.fetch("id_to_modify"))

    @connection.name = params.fetch("name")
    @connection.image = params.fetch("image") if params.key?("image")
    @connection.location = params.fetch("location")
    @connection.birthday = params.fetch("birthday")
    

    if @connection.valid?
      @connection.save

      redirect_to("/connections/#{@connection.id}", :notice => "Connection updated successfully.")
    else
      render("connection_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @connection = Connection.find(params.fetch("id_to_remove"))

    @connection.destroy

    redirect_to("/users/#{@connection.user_id}", notice: "Connection deleted successfully.")
  end

  def destroy_row
    @connection = Connection.find(params.fetch("id_to_remove"))

    @connection.destroy

    redirect_to("/connections", :notice => "Connection deleted successfully.")
  end
end

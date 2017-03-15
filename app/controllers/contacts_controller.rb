class ContactsController < ApplicationController

  def index
    search_results = params[:purple_hippo]
    group_filter = params[:group]
    if current_user
      if search_results
        @contacts = current_user.contacts.where(name: search_results)
      elsif group_filter
        selected_group = Group.find_by(name: group_filter)
        @contacts = selected_group.contacts.where(user_id: current_user.id)
      else
        @contacts = current_user.contacts
      end
      render "index.html.erb"
    else
      redirect_to "/login"
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    address = params[:input_address]
    coordinates = Geocoder.coordinates(address)
    if coordinates
      latitude = coordinates[0]
      longitude = coordinates[1]
    else
      latitude = nil
      longitude = nil
    end
    @contact = Contact.new(first_name: params[:input_first_name], middle_name: params[:input_middle_name], last_name: params[:input_last_name], email: params[:input_email], phone_number: params[:input_phone], latitude: latitude, longitude: longitude, user_id: current_user.id)
    @contact.save
    redirect_to "/contacts/#{@contact.id}"
  end

  def edit
    @contact = Contact.find(params[:id])
    render "edit.html.erb"
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.assign_attributes(first_name: params[:input_first_name], middle_name: params[:input_middle_name], last_name: params[:input_last_name], email: params[:input_email], phone_number: params[:input_phone])
    @contact.save
    render "update.html.erb"
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render "destroy.html.erb"
  end

  def all_johns
    @contacts = Contact.all_johns
    render "all_johns.html.erb"
  end
end

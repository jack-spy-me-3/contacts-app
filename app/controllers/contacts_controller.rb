class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def show
    @contact = Contact.find(params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @contact = Contact.new(first_name: params[:input_first_name], middle_name: params[:input_middle_name], last_name: params[:input_last_name], email: params[:input_email], phone_number: params[:input_phone])
    @contact.save
    render "create.html.erb"
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

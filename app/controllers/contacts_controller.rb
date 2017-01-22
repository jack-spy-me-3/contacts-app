class ContactsController < ApplicationController

  def first_contact_method
    @contact = Contact.first
    render "contact_info.html.erb"
  end

  def all_contacts_method
    @contacts = Contact.all
    render "all_contacts_info.html.erb"
  end

  def new_contact_form_method
    render "new_contact_form_page.html.erb"
  end

  def new_contact_result_method
    @contact = Contact.new(first_name: params[:input_first_name], last_name: params[:input_last_name], email: params[:input_email], phone_number: params[:input_phone])
    @contact.save
    render "new_contact_result_page.html.erb"
  end
end

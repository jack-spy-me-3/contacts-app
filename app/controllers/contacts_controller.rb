class ContactsController < ApplicationController

  def first_contact_method
    @contact = Contact.first
    render "contact_info.html.erb"
  end

  def all_contacts_method
    @contacts = Contact.all
    render "all_contacts_info.html.erb"
  end
end

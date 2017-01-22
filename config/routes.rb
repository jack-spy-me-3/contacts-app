Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/first_contact", to: "contacts#first_contact_method"
  get "/all_contacts", to: "contacts#all_contacts_method"

  get "/new_contact_form", to: "contacts#new_contact_form_method"
  post "/new_contact_result", to: "contacts#new_contact_result_method"
end

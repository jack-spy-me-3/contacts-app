class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_groups
  has_many :groups, through: :contact_groups

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def japanese_number
    "+81 " + phone_number
  end

  def self.all_johns
    where(first_name: "John")
  end

  def address
    geo_localization = "#{latitude},#{longitude}"
    query = Geocoder.search(geo_localization).first
    if query 
      query.address
    else
      "no address"
    end
  end
end

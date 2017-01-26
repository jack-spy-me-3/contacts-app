class Contact < ApplicationRecord

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
end

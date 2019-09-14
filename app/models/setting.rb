class Setting < ApplicationRecord
  validates :web_name, :email, :phone, :address, presence: true

  rails_admin do

    object_label_method do
      :web_name
    end

    list do
      field :web_name do
        label "Nama Website"
      end
      field :email do
        label "Email"
      end
      field :phone do
        label "Telepon"
      end
      field :address do
        label "Alamat"
      end
    end

    show do
      field :web_name do
        label "Nama Website"
      end
      field :email do
        label "Email"
      end
      field :phone do
        label "Telepon"
      end
      field :address do
        label "Alamat"
      end
    end

    edit do
      field :web_name do
        label "Nama Website"
      end
      field :email do
        label "Email"
      end
      field :phone do
        label "Telepon"
      end
      field :address do
        label "Alamat"
      end
    end
  end
end

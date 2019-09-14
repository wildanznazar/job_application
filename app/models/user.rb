class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable, :trackable

  has_many :profiles, :dependent => :destroy
  has_many :job_ads, :dependent => :destroy
  has_many :applicants, :dependent => :destroy
  has_many :company_applicants, class_name: "Applicant", foreign_key: "company_id", :dependent => :destroy

  rails_admin do
    object_label_method do
      :email
    end

    list do
    	field :email
    	field :name
    	field :role
    end

    edit do
    	field :email do
        label "Email Akun"
        read_only true
      end
      field :name do
        label "Nama Akun"
      end
      field :company_name do
        label "Nama Perusahaan"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"]
        end
      end
      field :address do
        label "Alamat Perusahaan"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"]
        end
      end
      field :website do
        label "Website Perusahaan"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"]
        end
      end
      field :company_email do
        label "Email Perusahaan"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"]
        end
      end
      field :phone do
        label "Telepon Perusahaan"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"]
        end
      end
    	field :role do
        visible do
          bindings[:view]._current_user.role == CONFIG["admin"]
        end
      end
    	field :password
    	field :password_confirmation
    end
  end

  after_create do
    if self.role == CONFIG["user"]
      self.profiles.create
    end
  end

  def self.role_enum
  	[CONFIG["admin"], CONFIG["company"], CONFIG["user"]]
  end

  def profile
    self.profiles.first
  end
end

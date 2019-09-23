class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable, :trackable

  has_many :profiles, :dependent => :destroy
  has_many :job_ads, :dependent => :destroy
  has_many :applicants, :dependent => :destroy
  has_many :company_applicants, class_name: "Applicant", foreign_key: "company_id", :dependent => :destroy

  validates :email, :name, :role, presence: true
  validates :password, presence: true, on: :create

  rails_admin do
    object_label_method do
      :email
    end

    list do
    	field :email
    	field :name
    	field :role
    end

    create do
    	field :email do
        label "Email"
      end
      field :name do
        label "Nama"
      end
      # field :company_name do
      #   label "Nama"
      #   visible do
      #     bindings[:view]._current_user.role == CONFIG["company"] || bindings[:view]._current_user.role == CONFIG["admin"]
      #   end
      # end
      field :address do
        label "Alamat"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"] || bindings[:view]._current_user.role == CONFIG["admin"]
        end
      end
      field :website do
        label "Website"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"] || bindings[:view]._current_user.role == CONFIG["admin"]
        end
      end
      # field :company_email do
      #   label "Email"
      #   visible do
      #     bindings[:view]._current_user.role == CONFIG["company"] || bindings[:view]._current_user.role == CONFIG["admin"]
      #   end
      # end
      field :phone do
        label "Telepon"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"] || bindings[:view]._current_user.role == CONFIG["admin"]
        end
      end
    	field :role do
        visible do
          bindings[:view]._current_user.role == CONFIG["admin"]
        end
      end
    	field :password
    end

    edit do
      field :email do
        label "Email"
        read_only true
      end
      field :name do
        label "Nama"
      end
      # field :company_name do
      #   label "Nama"
      #   visible do
      #     bindings[:view]._current_user.role == CONFIG["company"] || bindings[:view]._current_user.role == CONFIG["admin"]
      #   end
      # end
      field :address do
        label "Alamat"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"] || bindings[:view]._current_user.role == CONFIG["admin"]
        end
      end
      field :website do
        label "Website"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"] || bindings[:view]._current_user.role == CONFIG["admin"]
        end
      end
      # field :company_email do
      #   label "Email"
      #   visible do
      #     bindings[:view]._current_user.role == CONFIG["company"] || bindings[:view]._current_user.role == CONFIG["admin"]
      #   end
      # end
      field :phone do
        label "Telepon"
        visible do
          bindings[:view]._current_user.role == CONFIG["company"] || bindings[:view]._current_user.role == CONFIG["admin"]
        end
      end
      field :company_info, :wysihtml5 do
        label "Info Singkat"
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
    end
  end

  after_create do
    if self.role == CONFIG["user"]
      profile = self.profiles.new
      profile.save(validate: false)
    end
  end

  def self.role_enum
  	[CONFIG["admin"], CONFIG["company"], CONFIG["user"]]
  end

  def profile
    self.profiles.first
  end

  def label
    "asda"
  end

  def self.search(search)
    if search
      self.where("upper(name) LIKE ? ", "%#{search.upcase}%")
    else
      all
    end
  end

end

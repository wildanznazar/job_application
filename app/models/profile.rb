class Profile < ApplicationRecord
  belongs_to :user
  has_many :educations, :dependent => :destroy, :inverse_of => :profile
  has_many :experiences, :dependent => :destroy, :inverse_of => :profile

  accepts_nested_attributes_for :educations, :allow_destroy => true
  accepts_nested_attributes_for :experiences, :allow_destroy => true

  validates :image, :name, :gender, :phone, :email, :address, :dob, :skill, 
            :expected_salary, :resume, :description, :educations, :experiences, presence: true

  has_attached_file :image,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/,
  size: { in: 0..500.kilobytes }
  # add a delete_<image_name> method:
  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  has_attached_file :resume, styles: { thumbnail: "60x60#" }
  validates_attachment :resume, content_type: { content_type: ["application/pdf", "application/doc", "application/docx"] },
  size: { in: 0..1000.kilobytes }
  # add a delete_<asset_name> method:
  attr_accessor :delete_resume
  before_validation { self.resume.clear if self.delete_resume == '1' }

  rails_admin do
    weight -1
    label "Profil"
    label_plural "Profil"

    object_label_method do
      :name
    end

    list do
      field :name do
        label "Nama"
      end
      field :gender do
        label "Jenis Kelamin"
      end
      field :phone do
        label "Telepon"
      end
      field :email do
        label "Email"
      end
      field :address do
        label "Alamat"
      end
      field :dob do
        label "Tgl. Lahir"
      end
      field :skill do
        label "Keahlian"
      end
      field :expected_salary do
        label "Gaji yang Diinginkan"
      end
			exclude_fields :created_at, :updated_at
    end

    edit do
      field :image do
        label "Gambar"
      end
      field :name do
        label "Nama"
      end
      field :gender do
        label "Jenis Kelamin"
      end
      field :phone do
        label "Telepon"
      end
      field :email do
        label "Email"
      end
      field :address do
        label "Alamat"
      end
      field :dob do
        label "Tgl. Lahir"
      end
      field :skill do
        label "Keahlian"
      end
      field :expected_salary do
        label "Gaji yg Diinginkan"
      end
      field :educations do
        label "Pendidikan"
      end
      field :experiences do
        label "Pengalaman Kerja"
      end
      field :description, :wysihtml5 do
        label "Keterangan Tambahan"
      end
      field :resume do
        label "Unggah Resume / CV (pdf & docx format)"
      end
			exclude_fields :user, :created_at, :updated_at
    end
  end

  def gender_enum
    ["Laki-laki", "Perempuan"]
  end
end

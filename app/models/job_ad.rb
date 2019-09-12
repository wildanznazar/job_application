class JobAd < ApplicationRecord
  belongs_to :user
  has_many :applicants, :dependent => :destroy

  rails_admin do
    weight -1
    label "Iklan Pekerjaan"
    label_plural "Iklan Pekerjaan"

    object_label_method do
      :position_title
    end

    list do
      field :position_title do
        label "Posisi"
      end
      field :position_level do
        label "Jabatan"
      end
      field :employment_type do
        label "Jenis Pekerjaan"
      end
      field :job_specialization do
        label "Spesialisasi Pekerjaan"
      end
      field :work_location do
        label "Lokasi Kerja"
      end
      field :monthly_salary do
        label "Gaji per Bulan"
      end
      field :education_level do
        label "Tingkat Pendidikan"
      end
      field :field_of_studies do
        label "Jurusan"
      end
      field :years_of_experience do
        label "Lama Pengalaman Kerja"
      end
      field :skills do
        label "Keahlian"
      end
      field :language do
        label "Bahasa yang Digunakan"
      end
      field :job_description do
        label "Keterangan Lengkap"
      end
      field :ad_period do
        label "Masa Berlaku Iklan"
      end
      exclude_fields :created_at, :updated_at
    end

    edit do
      field :user do
        label "Akun User"
        default_value do
          bindings[:view]._current_user
        end
        read_only true
      end

      field :position_title do
        label "Posisi"
      end
      field :position_level do
        label "Jabatan"
      end
      field :employment_type do
        label "Jenis Pekerjaan"
      end
      field :job_specialization do
        label "Spesialisasi Pekerjaan"
      end
      field :work_location do
        label "Lokasi Kerja"
      end
      field :monthly_salary do
        label "Gaji per Bulan"
      end
      field :education_level do
        label "Tingkat Pendidikan"
      end
      field :field_of_studies do
        label "Jurusan"
      end
      field :years_of_experience do
        label "Lama Pengalaman Kerja"
      end
      field :skills do
        label "Keahlian"
      end
      field :language do
        label "Bahasa yang Digunakan"
      end
      field :job_description, :wysihtml5 do
        label "Keterangan Lengkap"
      end
      field :ad_period do
        label "Masa Berlaku Iklan"
      end
      exclude_fields :created_at, :updated_at
    end
  end

  def employment_type_enum
    ["Kontrak", "Full-Time", "Magang", "Part-Time", "Sementara"]
  end

  def position_level_enum
    ["CEO / GM / Director / Senior Manager", "Manager / Asistant Manager", "Supervisor / Coordinator", "Staff (non-management & non-supervisor)", "Pengalaman Kerja Dibawah 1 Tahun"]
  end

  def education_level_enum
    ["SD / MI", "SMP / MTS", "SMA / SMK / MA", "Diploma", "Sarjana", "Magister", "Doktor"]
  end

  paginates_per 10

  def self.search(search)
    if search
      self.joins(:user).where("position_title LIKE ? OR users.company_name LIKE ? OR skills LIKE ?","%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

end

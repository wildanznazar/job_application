class JobAd < ApplicationRecord
  belongs_to :user
  has_many :applicants, :dependent => :destroy

  validates :position_title, :position_level, :employment_type, :job_specialization, :work_location,
            :monthly_salary, :education_level, :field_of_studies, :years_of_experience, :skills,
            :language, :job_description, :ad_period, presence: true

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
        label "Deskripsi Pekerjaan"
      end
      field :ad_period do
        label "Masa Berlaku Iklan"
      end
      exclude_fields :created_at, :updated_at
    end

    edit do
      field :user do
        label "Perusahaan"
        partial 'company_user'
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
        label "Deskripsi Pekerjaan"
      end
      field :ad_period do
        label "Iklan Berakhir Pada Tgl."
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

  paginates_per 25

  def self.search(search)
    if search
      self.joins(:user).where("upper(job_ads.position_title) LIKE ? OR upper(users.name) LIKE ? OR upper(job_ads.skills) LIKE ?","%#{search.upcase}%", "%#{search.upcase}%", "%#{search.upcase}%")
    else
      all
    end
  end

end

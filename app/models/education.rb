class Education < ApplicationRecord
  belongs_to :profile, :inverse_of => :educations

  rails_admin do
  	visible false
    label "Pendidikan"
    label_plural "Pendidikan"

    object_label_method do
      :institute
    end

    edit do
      field :institute do
        label "Nama Universitas / Sekolah"
      end
      field :qualification do
        label "Pendidikan"
      end
      field :field_of_study do
        label "Jurusan / Fakultas"
      end
      field :grade do
        label "Nilai"
      end
      field :graduation_date do
        label "Tgl. Lulus"
      end
      # field :description, :wysihtml5 do
      #   label "Keterangan"
      # end
			exclude_fields :created_at, :updated_at
    end
  end

  def qualification_enum
    ["SD / MI", "SMP / MTS", "SMA / SMK / MA", "Diploma", "Sarjana", "Magister", "Doktor"]
  end
end

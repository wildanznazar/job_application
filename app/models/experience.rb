class Experience < ApplicationRecord
	belongs_to :profile, :inverse_of => :experiences

  rails_admin do
  	visible false
    label "Pengalaman Kerja"
    label_plural "Pengalaman Kerja"

    object_label_method do
      :position_title
    end

    edit do
      field :position_title do
        label "Posisi / Jabatan"
      end
      field :company_name do
        label "Nama Perusahaan"
      end
      field :industry do
        label "Industri Perusahaan"
      end
      field :join_start do
        label "Tgl. Bergabung"
      end
      field :join_end do
        label "Tgl. Keluar"
      end
      field :present do
        label "Masih Bekerja Sampai Sekarang"
      end
      # field :role do
      #   label "Jabatan"
      # end
      field :monthly_aslary do
        label "Gaji per Bulan"
      end
      # field :description, :wysihtml5 do
      #   label "Keterangan"
      # end
			exclude_fields :created_at, :updated_at
    end
  end
end

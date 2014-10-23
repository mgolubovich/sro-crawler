class Exporter
	def initialize filename
		@file_name = filename + ".csv"
		File.delete(@file_name) if File.exist?(@file_name)
		CSV.open(@file_name, "ab", {col_sep:';', :encoding => 'windows-1251'}) do |csv|
			csv << ['ИНН',
				'Краткое наименование',
				'Город',
				'Регион',
				'Должность руководителя',
				'Фамилия руководителя',
				'Имя руководителя',
				'Отчество руководителя',
				'Сумма генподряда',
				'Статус в СРО',
				'Статус торгов',
				'Членские взносы',
				'Страхвка',
				'Проверка',
				'Допуск выдан',
				'Юридический адрес',
				'Фактический адрес',
				'Телефон',
				'Факс',
				'E-mail',
				'Веб-сайт',
				'Полное наименование',
				'ОГРН',
				'КПП',
				'Номер свидетельства',
				'Виды работ']
		end	
	end

	def save_to_csv values_utf8
		values = encode_values values_utf8
		output = [values[:inn], 
			values[:short_title], 
			values[:city], 
			nil, 
			values[:chief_position],
			values[:chief_last_name],
			values[:chief_first_name],
			values[:chief_middle_name],
			values[:general_sum],
			values[:sro_status],
			nil,
			nil,
			values[:ensurance_before],
			nil,
			values[:admission_date],
			values[:law_address],
			values[:fact_address],
			values[:phone],
			values[:fax],
			values[:email],
			values[:site_url],
			values[:full_title],
			values[:ogrn],
			nil,
			values[:admission_code],
			nil
			]

		CSV.open(@file_name, "ab", {col_sep:';', :encoding => 'windows-1251'}) do |csv|
			csv << output
		end	
	end

	def encode_values values
		decoded = {}
		values.each do |key,value|
			if value 
				decoded[key] = value.encode!("windows-1251", "utf-8", :invalid => :replace, :undef => :replace)
			else
				decoded[key] = nil
			end
		end
		decoded
	end

end

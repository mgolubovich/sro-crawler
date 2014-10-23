#main class for collecting entities

class Type4Crawler
	def initialize driver
		@driver = driver
	end

	def collect_links
		links_elements_list = @driver.find_elements(css:'a[href*="view"]')
		links = []
		links_elements_list.each do |e|
			links << e.attribute('href')
		end
		links
	end

	def collect_values(link)
		values = {}
		@driver.navigate.to link
		values[:inn] = '"' + find_after("ИНН") + '"'
		#collect_raw_title
		#values[:short_title] = short_title
		values[:short_title] = find_by_xpath('(//small/parent::*)[1]')[/^(.*)\(/,1]
		values[:city] = find_by_xpath("(//th[contains(text(), 'Город')]/following::td)[1]") #find_after "Город"
		collect_raw_chief
		values[:chief_position] = chief_position if @chief_raw_data
		values[:chief_last_name] = chief_last_name if @chief_raw_data
		values[:chief_first_name] = chief_first_name if @chief_raw_data
		values[:chief_middle_name] = chief_middle_name if @chief_raw_data
		#values[:general_sum] = find_after "Стоимость объекта по договору"
		values[:sro_status] = sro_status
		values[:ensurance_before] = find_after "Дата окончания действия договора страхования"
		values[:admission_date] = find_after "Дата выдачи свидетельства"
		values[:law_address] = find_after "Юридический адрес"
		values[:fact_address] = find_after "Юридический адрес"
		values[:phone] = find_after "Телефон"
		#values[:phone] = @driver.find_elements(xpath:'(//*[contains(text(), "Телефон")])[1]').first.text[/фон: (.*)/, 1] if @driver.find_elements(xpath:'(//*[contains(text(), "Телефон")])[1]').first
		values[:email] = find_after "Электронная почта"
		values[:site_url] = find_after "Веб-сайт"
		values[:fax] = find_after "Факс"
		values[:full_title] = find_after "Полное наименование организации"
		#values[:full_title] = full_title
		values[:ogrn] = '"' + find_after("ГРН") + '"' if find_after("ГРН")
		admission_code_raw = find_after("Номер свидетельства").split(" ").first if find_after("Номер свидетельства")
		values[:admission_code] = '"' + admission_code_raw + '"' if admission_code_raw
		values
	end

	private
	def chief_position
		position = ""
		@chief_raw_data.split(/\s/)[0..-4].each do |word|
			position += word + " "
		end
		position.strip
	end
	def sro_status
		raw_status = find_after "Текущий статус свидетельства"
		case raw_status.strip
		when 'Действует'||'Подтвержден'
			'Действует'
		when 'Приостановлено'
			'Приостановлен'
		when 'Прекращено'||'Аннулирован'||'Исключен'||'Исключено'||'Прекращен'||'Аннулировано'
			'Исключен'
		else
			nil
		end
	end
	def collect_raw_title
		@title_raw_data = find_by_css "h4"
	end
	def short_title
		@title_raw_data[/«(.*)»/,1]
	end
	def full_title
		@title_raw_data[/^(.*)\(/,1]
	end
	def chief_last_name
		@chief_raw_data.split(/\s/)[-3]
	end
	def chief_first_name
		@chief_raw_data.split(/\s/)[-2]
	end
	def chief_middle_name
		@chief_raw_data.split(/\s/)[-1]
	end
	def collect_raw_chief
		@chief_raw_data = find_after("Сведения о руководителе")
	end
	def find_after text
		@driver.find_elements(xpath:"(//*[contains(text(), '#{text}')]/following::*)[1]").first.text.strip if @driver.find_elements(xpath:"(//*[contains(text(), '#{text}')]/following::*)[1]").first
	end
	def find_by_xpath selector
		@driver.find_elements(xpath:selector).first.text.strip if @driver.find_elements(xpath:selector).first
	end
	def find_by_css selector
		@driver.find_elements(css:selector).first.text.strip if @driver.find_elements(css:selector).first
	end
end
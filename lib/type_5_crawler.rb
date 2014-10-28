class Type5Crawler

	def initialize driver
		@driver = driver
	end

	def collect_links start_link
		links = []
		@driver.navigate.to start_link
		sleep 3
		while @driver.find_element(xpath:"//img[@alt='Следующая страница']").attribute('class') == 'dxWeb_pNext_Office2010Silver'
			@driver.find_elements(css:'table#MainContent_gridViewMaster_DXMainTable tr')[1..-1].each do |tr|
				links << tr.find_element(css:'a').attribute('href') if tr.find_element(css:'td').attribute('title') == 'Статус организации: В СРО'
			end
			@driver.execute_script("aspxGVPagerOnClick('MainContent_gridViewMaster','PBN');")
			sleep 3
		end
		links
	end

	def collect_values(link)
		values = {}
		@driver.navigate.to link
		values[:inn] = '"' + find_after("ИНН:") + '"'
		#collect_raw_title
		#values[:short_title] = short_title
		values[:short_title] = find_after 'Сокращенное наименование:'
		values[:city] = find_after "Город:"
		collect_raw_chief
		values[:chief_position] = chief_position if @chief_raw_data
		values[:chief_last_name] = chief_last_name if @chief_raw_data
		values[:chief_first_name] = chief_first_name if @chief_raw_data
		values[:chief_middle_name] = chief_middle_name if @chief_raw_data
		#values[:general_sum] = find_after "Стоимость объекта по договору"
		values[:sro_status] = "Действует"
		values[:admission_date] = find_by_xpath("(//span[@id='MainContent_lbl_svidinfo']/div/span)[2]")[/(\d\d\.\d\d\.\d\d\d\d)/,1] if find_by_xpath("(//span[@id='MainContent_lbl_svidinfo']/div/span)[2]")
		values[:law_address] = find_after "Место нахождения:"
		values[:fact_address] = find_after "Место нахождения:"
		values[:phone] = find_after "Контактные телефоны:"
		#values[:phone] = @driver.find_elements(xpath:'(//*[contains(text(), "Телефон")])[1]').first.text[/фон: (.*)/, 1] if @driver.find_elements(xpath:'(//*[contains(text(), "Телефон")])[1]').first
		values[:email] = find_after "Электронная почта:"
		site_url_xpath = "(//*[contains(text(), 'Веб-сайт организации')]/following::*)[1]"
		values[:site_url] = find_after 'Веб-сайт:'
		values[:full_title] = find_by_css 'span#MainContent_lbl_name'
		#values[:full_title] = full_title
		values[:ogrn] = '"' + find_after("ОГРН") + '"' if find_after("ОГРН")
		admission_code_raw = find_by_css 'span#MainContent_lbl_svidinfo a'
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
		@chief_raw_data = find_after("Исполнительный орган:")
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
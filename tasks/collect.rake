namespace :collecting do 
	
	desc 'first task: collect sro from sfera-a registry'
	task :collect_sfera_type, :sro_code, :start_page do |t, args|
		Dir.mkdir('csv') unless Dir.exist?('csv')
		Dir.chdir('csv')
		collect_sfera_type args.sro_code, args.start_page
	end
	
	desc 'collect all sfera like data'
	task :collect_sfera_type_all do 
		Dir.mkdir('csv') unless Dir.exist?('csv')
		Dir.chdir('csv')
		sources_list = [['СРО-С-032-31082009','http://sro-npts.ru/sro/index.php'],
						['СРО-С-046-06102009','http://www.sro-sso.ru/reestr/index.php'],
						['СРО-С-056-28102009','http://registry.np-ss.org/'],
						['СРО-С-058-03112009','http://www.stroytambov.ru/reestr/'],
						['СРО-С-067-11112009','http://yktstroy.ru/online-reestr'],
						['СРО-С-068-16112009','http://www.sro-rs.ru/reestrs/index.php'],
						['СРО-С-077-23112009','http://reestr.srorossk.ru/'],
						['СРО-С-080-26112009','http://u6255.mass.hc.ru/index.php'],
						['СРО-С-081-27112009','http://www.stroiteli-kirov.ru/r/index.php'],
						['СРО-С-087-27112009','http://np-osvolga.ru/reestrsro/index.php'],
						['СРО-С-088-30112009','http://ssrd.reestrsro.ru/index.php'],
						['СРО-С-094-02122009','http://www.gvvs.ru/reestr/'],
						['СРО-С-096-02122009','http://mrsro2.ru/sro/'],
						['СРО-С-098-04122009','http://sropss.ru/reestrsro/index.php'],
						['СРО-С-103-07122009','http://uralsro.ru/reestr/'],
						['СРО-С-104-08122009','http://www.np-mcc.ru/reestr/'],
						['СРО-С-107-11122009','http://www.osvo33.ru/reestr/'],
						['СРО-С-110-11122009','http://expertiza.osp-sro.ru/wp-content/reestrsro/'],
						['СРО-С-114-16122009','http://iossro37.ru/reestr/'],
						['СРО-С-128-21122009','http://astroy-sro.ru/newreestrsro/'],
						['СРО-С-137-22122009','http://ospnp.ru/reestr/index.php'],
						['СРО-С-138-22122009','http://reestr.scvo34.ru/'],
						['СРО-С-145-23122009','http://moisp.moab.ru/membership/reestr_new/index.php'],
						['СРО-С-148-24122009','http://sro-mas.ru/ReestrMas14/index.php'],
						['СРО-С-151-24122009','http://coi.forum-sro.ru/'],
						['СРО-С-152-25122009','http://srobv.ru/sro/'],
						['СРО-С-164-29122009','http://www.profstroigroup.ru/reestr/'],
						['СРО-С-170-13012010','http://r.mas-sro.ru/'],
						['СРО-С-176-18012010','http://osko.su/reestr/index.php'],
						['СРО-С-199-12022010','http://reestr.sro-bos.ru/'],
						['СРО-С-203-24022010','http://www.nposk.ru/reestr/'],
						['СРО-С-212-29032010','http://np-flagman.ru/reestr-org/index.php'],
						['СРО-С-219-21042010','http://membersite.sroreestr.ru/default.aspx?s=386'],
						['СРО-С-249-12072012','http://www.sro-gaso.ru/module/index.php'],
						['СРО-С-253-05092012','http://sro-mrsa.ru/rstr/index.php']
					]
		sources_list.each do |sro_code, start_page|
			collect_sfera_type sro_code, start_page
		end
	end

	desc 'collect_type_5 all'
	task :collect_type_5_all do 
		Dir.mkdir('csv') unless Dir.exist?('csv')
		Dir.chdir('csv')
		sources_list = [['СРО-И-008-30112009','http://membersite.sroreestr.ru/default.aspx?s=181'],
						['СРО-И-010-11122009','http://membersite.sroreestr.ru/default.aspx?s=90'],
						['СРО-И-016-28122009','http://membersite.sroreestr.ru/default.aspx?s=190'],
						['СРО-П-002-22042009','http://membersite.sroreestr.ru/default.aspx?s=2'],
						['СРО-П-018-19082009','http://membersite.sroreestr.ru/default.aspx?s=51'],
						['СРО-П-030-28092009','http://membersite.sroreestr.ru/default.aspx?s=4'],
						['СРО-П-032-29092009','http://membersite.sroreestr.ru/default.aspx?s=42'],
						['СРО-П-047-09112009','http://membersite.sroreestr.ru/default.aspx?s=65'],
						['СРО-П-060-20112009','http://www.sro-protek.ru/IFrames/Organizations.aspx'],
						['СРО-П-066-30112009','http://membersite.sroreestr.ru/default.aspx?s=9'],
						['СРО-П-077-11122009','http://membersite.sroreestr.ru/default.aspx?s=90'],
						['СРО-П-100-23122009','http://membersite.sroreestr.ru/default.aspx?s=17'],
						['СРО-П-101-23122009','http://membersite.sroreestr.ru/default.aspx?s=58'],
						['СРО-П-104-24122009','http://membersite.sroreestr.ru/Organizations.aspx?s=116'],
						['СРО-П-106-25122009','http://membersite.sroreestr.ru/default.aspx?s=118'],
						['СРО-П-124-25012010','http://membersite.sroreestr.ru/default.aspx?s=135'],
						['СРО-П-128-27012010','http://membersite.sroreestr.ru/default.aspx?s=138'],
						['СРО-П-135-15022010','http://membersite.sroreestr.ru/default.aspx?s=145'],
						['СРО-П-141-27022010','http://membersite.sroreestr.ru/default.aspx?s=151'],
						['СРО-П-153-30032010','http://membersite.sroreestr.ru/default.aspx?s=163'],
						['СРО-П-154-15042010','http://membersite.sroreestr.ru/default.aspx?s=164'],
						['СРО-П-157-23072010','http://membersite.sroreestr.ru/default.aspx?s=167'],
						['СРО-П-185-16052013','http://membersite.sroreestr.ru/default.aspx?s=381'],
						['СРО-С-083-27112009','http://membersite.sroreestr.ru/default.aspx?s=383'],
						['СРО-С-120-17122009','http://membersite.sroreestr.ru/default.aspx?s=395'],
						['СРО-С-162-28122009','http://www.monolitsro.ru/IFrames/Organizations.aspx'],
						['СРО-С-174-14012010','http://membersite.sroreestr.ru/Organizations.aspx?s=394'],
						['СРО-С-202-19022010','http://membersite.sroreestr.ru/default.aspx?s=382']
					]
		sources_list.each do |sro_code, start_page|
			collect_type_5 sro_code, start_page
		end
	end

	desc 'collect_type_5'
	task :collect_type_5, :sro_code, :start_page do |t, args|
		Dir.mkdir('csv') unless Dir.exist?('csv')
		Dir.chdir('csv')
		collect_type_5 args.sro_code, args.start_page
	end

	def collect_sfera_type sro_code, start_page
		driver = Selenium::WebDriver.for :chrome
		driver.navigate.to start_page
		bot = Type4Crawler.new driver
		exporter = Exporter.new(sro_code)
		while driver.find_elements(css: "li[class='next'] a").count > 0 
			next_page_link = driver.find_elements(css: "li[class='next'] a").first.attribute('href')
			links = bot.collect_links
			links.each do |link|
				exporter.save_to_csv(bot.collect_values(link))
			end
			driver.navigate.to next_page_link
		end
		driver.quit
	end

	def collect_type_5 sro_code, start_page
		driver = Selenium::WebDriver.for :chrome
		bot = Type5Crawler.new driver
		exporter = Exporter.new(sro_code)
		links = bot.collect_links start_page
		links.each do |link|
			exporter.save_to_csv(bot.collect_values(link))
		end
		driver.quit
	end

	desc 'collect all links and htmls'
	task :collect_raw_htmls, :sro_code, :start_page do |t, args|
		collect_raw_htmls args.sro_code, args.start_page
	end

	desc 'collect all raw data'
	task :collect_raw_all do 
		sources_list = [['СРО-П-035-12102009','http://stroypb.moab.ru/membership/reestr_new/index.php'],
						['СРО-П-036-14102009','http://nplp.ru/reestrsro/?sort=regNumber'],
						['СРО-П-036-14102009','http://registry.npgap.ru/'],
						['СРО-П-069-02122009','http://mrsro.ru/sro/']]
		sources_list.each do |sro_code, start_page|
			collect_raw_htmls sro_code, start_page
		end
	end

	def collect_raw_htmls sro_code, start_page
		driver = Selenium::WebDriver.for :chrome
		driver.navigate.to start_page
		Dir.mkdir(sro_code) unless Dir.exist?(sro_code)
		while driver.find_elements(css: "li[class='next'] a").count > 0 	
			next_page_link = driver.find_elements(css: "li[class='next'] a").first.attribute('href')
			links_elements_list = driver.find_elements(css:'a[href*="view"]')
			links = []
			links_elements_list.each do |e|
				links << e.attribute('href')
			end
			links.each do |link|
				File.delete(sro_code + '/' + link[/id=(.*)/,1] + ".yml") if File.exist?(sro_code + '/' + link[/id=(.*)/,1] + ".yml")
				driver.navigate.to link
				File.open(sro_code + '/' + link[/id=(.*)/,1] + ".yml", 'w:UTF-8') {|f| f.write driver.find_element(css:'html').attribute('innerHTML')}
			end
			driver.navigate.to next_page_link
		end
		driver.quit
	end
end

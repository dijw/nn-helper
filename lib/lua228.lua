script_name("MultiTools")
script_authors("pedor")
script_version_number(1)
script_properties("work-in-pause")

local sampev = require "lib.samp.events"
require "lib.sampfuncs"
require "lib.moonloader"



--------- Переменные ---------
res, edate, timeAct, earsStatus, smena, norma, newRepSt, AFK, kpzPidora2 = nil
kpzPidora, smstp, gcmd = 0
newTime = 1
nickChange = 1
newReport = 1
nickKPZ = 'Xavier_Adamson'

	
function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end

	--------- Команды ---------
	
	sampRegisterChatCommand("rel",cmd_rel)
	sampRegisterChatCommand("gban", gban)
	sampRegisterChatCommand("gwarn", gwarn)
	sampRegisterChatCommand("slap",cmd_slap)
	sampRegisterChatCommand("adamson", adamson)
	sampRegisterChatCommand("smstp", smstpp)
	sampRegisterChatCommand("gosms", ears)
	
	sampRegisterChatCommand("test", function() _test:run() end)
    _test = lua_thread.create_suspended(test)
	

	while true do
		AFK = isGamePaused()
		if wasKeyPressed(VK_J) and not sampIsChatInputActive() and not sampIsDialogActive() then adamson() end
		
		if nickChange == 1 then smena = "{9ACD32}[Включено]" else smena = "{FF6347}[Выключено]" end
		if newTime == 1 then norma = "{9ACD32}[Включено]" else norma = "{FF6347}[Выключено]" end
		if newReport == 1 then newRepSt = "{9ACD32}[Включено]" else newRepSt = "{FF6347}[Выключено]" end
		if kpzPidora == 1 then kpzPidora2 = "{9ACD32}[Включено]" else kpzPidora2 = "{FF6347}[Выключено]" end
		
		if smstp == 1 and playerTPid ~= nil and playerTPid ~= "" then
			playerTPs(playerTPid)
		end
		if smstp == 1 and playerTPname ~= nil and playerTPname ~= "" then
			local playerTPid = sampGetPlayerIdByNickname(playerTPname)
			playerTPs(playerTPid)
		end
	
		
		local mainDialog, buttonMain, listMain = sampHasDialogRespond(1001) -- /adamson, основной диалог
		if mainDialog then
			if buttonMain == 1 then
				if listMain == 0 then
					sampShowDialog(1002, "{0099FF}MultiTools by Adamson{FFFFFF} | MSG", "{0099FF}*{FFFFFF} Пожелания(2 стр)\n{0099FF}*{FFFFFF} Правила репорта(3 стр)", "Выбрать", "Закрыть", 2)
				end
				if listMain == 1 then
					sampShowDialog(1003, "{0099FF}MultiTools by Adamson{FFFFFF} | Функции", string.format("{0099FF}*{FFFFFF} Отказ смены\t%s\n{0099FF}*{FFFFFF} Подсчет нормы\t%s\n{0099FF}*{FFFFFF} Новый репорт\t%s\n{0099FF}*{FFFFFF} Вечное КПЗ дауну\t%s", smena, norma, newRepSt, kpzPidora2), "Выбрать", "Закрыть", 2)
				end
				if listMain == 2 then
					sampShowDialog(1004, "{0099FF}MultiTools by Adamson{FFFFFF} | О скрипте", "{0099FF}MultiTools by Adamson{FFFFFF} - LUA скрипт написанный администратором Chocolate сервера {0099FF}Xavier Adamson{FFFFFF}.\n Данный скрипт дополняет административный функционал для удобства в работе, да и в целом для развития навыков LUA :D\n\n\n{0099FF}Дополнительные команды:\n{0099FF}/gban{FFFFFF} - выдать бан на капте.\n{0099FF}/gwarn{FFFFFF} - выдать варн на капте.\n{0099FF}/rel{FFFFFF} - перезагрузить скрипт.\n{0099FF}/adamson{FFFFFF} - открыть меню командой.\n{0099FF}/slap{FFFFFF} - слаппер из SP.\n{0099FF}/smstp{FFFFFF} - включить телепорт через сообщение /tp в SMS.\n{0099FF}/gosms{FFFFFF} - включить выделение в EARS.", "Закрыть", "",0)
				end
			end
		end
		
		local msgDialog, buttonMain, listMain = sampHasDialogRespond(1002) -- Диалог выбора /msg
		if msgDialog then
			if buttonMain == 1 then
				if listMain == 0 then
					sampSendChat("/msg 0 Администрация Chocolate сервера желает вам приятной игры и хорошего настроения :)")
					wait(300)
					sampSendChat("/msg 0 Используйте /play для прослушивания музыки.")
				end
				if listMain == 1 then
					sampSendChat("/msg 0 Напоминаем, в репорт можно задать вопросы по игровому моду или пожаловаться на игрока.")
					wait(300)
					sampSendChat("/msg 0 Жалобу на игрока подавайте корректно по форме (ID нарушителя | Нарушение).")
					wait(300)
					sampSendChat("/msg 0 За любые другие сообщения не по теме в репорт - вы будете наказаны.")
				end
			end		
		end
		
		local funcDialog, buttonMain, listMain = sampHasDialogRespond(1003) -- Диалог списка функций
		if funcDialog then
			if buttonMain == 1 then
				if listMain == 0 then
					if nickChange == 0 then 
						nickChange = 1
						sampAddChatMessage("[MultiTools]{FFFFFF} Автоматический отказ смены ника включен.", 0x0099FF)
						if nickChange == 1 then smena = "{9ACD32}[Включено]" else smena = "{FF6347}[Выключено]" end
						sampShowDialog(1003, "{0099FF}MultiTools by Adamson{FFFFFF} | Функции", string.format("{0099FF}*{FFFFFF} Отказ смены\t%s\n{0099FF}*{FFFFFF} Подсчет нормы\t%s\n{0099FF}*{FFFFFF} Новый репорт\t%s\n{0099FF}*{FFFFFF} Вечное КПЗ дауну\t%s", smena, norma, newRepSt, kpzPidora2), "Выбрать", "Закрыть", 2)
					else
						nickChange = 0
						sampAddChatMessage("[MultiTools]{FFFFFF} Автоматический отказ смены ника выключен.", 0x0099FF)
						if nickChange == 1 then smena = "{9ACD32}[Включено]" else smena = "{FF6347}[Выключено]" end
						sampShowDialog(1003, "{0099FF}MultiTools by Adamson{FFFFFF} | Функции", string.format("{0099FF}*{FFFFFF} Отказ смены\t%s\n{0099FF}*{FFFFFF} Подсчет нормы\t%s\n{0099FF}*{FFFFFF} Новый репорт\t%s\n{0099FF}*{FFFFFF} Вечное КПЗ дауну\t%s", smena, norma, newRepSt, kpzPidora2), "Выбрать", "Закрыть", 2)
					end
				end
				if listMain == 1 then
					if newTime == 0 then
						newTime = 1
						sampAddChatMessage("[MultiTools]{FFFFFF} Подсчет нормы в /c 60 включен.", 0x0099FF)
						if newTime == 1 then norma = "{9ACD32}[Включено]" else norma = "{FF6347}[Выключено]" end
						sampShowDialog(1003, "{0099FF}MultiTools by Adamson{FFFFFF} | Функции", string.format("{0099FF}*{FFFFFF} Отказ смены\t%s\n{0099FF}*{FFFFFF} Подсчет нормы\t%s\n{0099FF}*{FFFFFF} Новый репорт\t%s\n{0099FF}*{FFFFFF} Вечное КПЗ дауну\t%s", smena, norma, newRepSt, kpzPidora2), "Выбрать", "Закрыть", 2)
					else
						newTime = 0
						sampAddChatMessage("[MultiTools]{FFFFFF} Подсчет нормы в /c 60 выключен.", 0x0099FF)
						if newTime == 1 then norma = "{9ACD32}[Включено]" else norma = "{FF6347}[Выключено]" end
						sampShowDialog(1003, "{0099FF}MultiTools by Adamson{FFFFFF} | Функции", string.format("{0099FF}*{FFFFFF} Отказ смены\t%s\n{0099FF}*{FFFFFF} Подсчет нормы\t%s\n{0099FF}*{FFFFFF} Новый репорт\t%s\n{0099FF}*{FFFFFF} Вечное КПЗ дауну\t%s", smena, norma, newRepSt, kpzPidora2), "Выбрать", "Закрыть", 2)
					end
				end
				if listMain == 2 then
					if newReport == 0 then
						newReport = 1
						sampAddChatMessage("[MultiTools]{FFFFFF} Модифицированный репорт включен.", 0x0099FF)
						if newReport == 1 then newRepSt = "{9ACD32}[Включено]" else newRepSt = "{FF6347}[Выключено]" end
						sampShowDialog(1003, "{0099FF}MultiTools by Adamson{FFFFFF} | Функции", string.format("{0099FF}*{FFFFFF} Отказ смены\t%s\n{0099FF}*{FFFFFF} Подсчет нормы\t%s\n{0099FF}*{FFFFFF} Новый репорт\t%s\n{0099FF}*{FFFFFF} Вечное КПЗ дауну\t%s", smena, norma, newRepSt, kpzPidora2), "Выбрать", "Закрыть", 2)
					else
						newReport = 0
						sampAddChatMessage("[MultiTools]{FFFFFF} Модифицированный репорт выключен.", 0x0099FF)
						if newReport == 1 then newRepSt = "{9ACD32}[Включено]" else newRepSt = "{FF6347}[Выключено]" end
						sampShowDialog(1003, "{0099FF}MultiTools by Adamson{FFFFFF} | Функции", string.format("{0099FF}*{FFFFFF} Отказ смены\t%s\n{0099FF}*{FFFFFF} Подсчет нормы\t%s\n{0099FF}*{FFFFFF} Новый репорт\t%s\n{0099FF}*{FFFFFF} Вечное КПЗ дауну\t%s", smena, norma, newRepSt, kpzPidora2), "Выбрать", "Закрыть", 2)
					end
				end
				if listMain == 3 then
					if kpzPidora == 0 then
						kpzPidora = 1
						sampAddChatMessage("[MultiTools]{FFFFFF} Даун будет сидеть в КПЗ вечно.", 0x0099FF)
						if kpzPidora == 1 then kpzPidora2 = "{9ACD32}[Включено]" else kpzPidora2 = "{FF6347}[Выключено]" end
						sampShowDialog(1003, "{0099FF}MultiTools by Adamson{FFFFFF} | Функции", string.format("{0099FF}*{FFFFFF} Отказ смены\t%s\n{0099FF}*{FFFFFF} Подсчет нормы\t%s\n{0099FF}*{FFFFFF} Новый репорт\t%s\n{0099FF}*{FFFFFF} Вечное КПЗ дауну\t%s", smena, norma, newRepSt, kpzPidora2), "Выбрать", "Закрыть", 2)
					else
						kpzPidora = 0
						sampAddChatMessage("[MultiTools]{FFFFFF} Пощада дауна вкюлчена.", 0x0099FF)
						if kpzPidora == 1 then kpzPidora2 = "{9ACD32}[Включено]" else kpzPidora2 = "{FF6347}[Выключено]" end
						sampShowDialog(1003, "{0099FF}MultiTools by Adamson{FFFFFF} | Функции", string.format("{0099FF}*{FFFFFF} Отказ смены\t%s\n{0099FF}*{FFFFFF} Подсчет нормы\t%s\n{0099FF}*{FFFFFF} Новый репорт\t%s\n{0099FF}*{FFFFFF} Вечное КПЗ дауну\t%s", smena, norma, newRepSt, kpzPidora2), "Выбрать", "Закрыть", 2)
					end
				end
				
				
			end
		end
		-- диалоги
		wait(0)
	end
end

function test()
	sampAddChatMessage("[MultiTools] {FFFFFF}Вы запросили {4682B4}'что-то'{FFFFFF}, подтвердите на {B22222}End{FFFFFF}.",0x0099FF)
	jdate = tonumber(os.clock())
	edate = jdate+7
	while jdate < edate do
		jdate=os.clock()
		if isKeyJustPressed(35) then
			res = 1
			edate = jdate
		end
		wait(0)
	end	
	if res ~= 1 then
		sampAddChatMessage("[MultiTools] {FFFFFF}Время ожидания истекло.", 0x0099FF)
	end
	res = 0
end

function playerTPs(id)
sampSendChat("/gethere " .. id)
playerTPid = nil
playerTPname = nil
wait(1500)
end

function adamson()
	sampShowDialog(1001, "{0099FF}MultiTools by Adamson", "{0099FF}*{FFFFFF} MSG шаблоны\n{0099FF}*{FFFFFF} Функиции\n{0099FF}*{FFFFFF} О скрипте", "Выбрать", "Закрыть", 2)
end

function ears(id)
	if earsStatus == nil then
		if id ~= "" then
			if sampIsPlayerConnected(id) then
				PlayerNameEars = sampGetPlayerNickname(id)
				sampAddChatMessage("[MultiTools]:{FFFFFF} Включено выделение прослушки для игрока {FF0000}" .. PlayerNameEars, 0x0099FF)
				earsStatus = 1
			else
				sampAddChatMessage("[MultiTools]:{FFFFFF} Игрок не подключен к серверу.", 0x0099FF)
			end
		else
			sampAddChatMessage("[MultiTools]:{FFFFFF} Используйте /gosms [id]", 0x0099FF)
			sampAddChatMessage("[MultiTools]:{FFFFFF} Выделяет сообщения от указанного игрока в прослушке.", 0x0099FF)
		end
	else
		sampAddChatMessage("[MultiTools]:{FFFFFF} Выделение прослушки отключено.", 0x0099FF)
		earsStatus = nil
	end
end


function gwarn(lyl)
	if string.match(lyl,"^%d+%s.*") then
		idband, prichband = string.match(lyl,"(%d+)%s(.*)")
		gcmd = 1
		reason = 1
		sampSendChat("/st " .. idband)
	else
		sampAddChatMessage("[MultiTools]:{FFFFFF} Используйте /gwarn [id] [причина]", 0x0099FF)
		sampAddChatMessage("[MultiTools]:{FFFFFF} Выдаёт варн с указанием банды в причине.", 0x0099FF)
	end
end


function gban(lyl)
	if string.match(lyl,"^%d+%s%d+%s.*") then
		idband, dayband, prichband = string.match(lyl,"(%d+)%s(%d+)%s(.*)")
		gcmd = 1
		reason = 2
		sampSendChat("/st " .. idband)
	else
		sampAddChatMessage("[MultiTools]:{FFFFFF} Используйте /gban [id] [дни] [причина]", 0x0099FF)
		sampAddChatMessage("[MultiTools]:{FFFFFF} Выдаёт бан с указанием банды в причине.", 0x0099FF)
	end
end

function smstpp()
	if smstp == 0 then
		smstp = 1
		sampAddChatMessage("[MultiTools]:{FFFFFF} Вы включили телепорт по СМС.", 0x0099FF)
		sampAddChatMessage("[MultiTools]:{FFFFFF} Вам должны написать в СМС «/tp» для телепортации.", 0x0099FF)
	else
		sampAddChatMessage("[MultiTools]:{FFFFFF} Вы отключили телепорт по СМС.", 0x0099FF)
		smstp = 0
	end
end

function cmd_slap(params)
	slaps = 0
	slapcount = 0
	delay = 150 
	if string.match(params,"^%d+%s%d+") then
		slapcount, delay = string.match(params,"^(%d+)%s(%d+)")
		slapcount = tonumber(slapcount)
		delay = tonumber(delay)
		if delay < 120 then
			sampAddChatMessage("[MultiTools] {BEBEBE}Недопустимый интервал.",0x0099FF)
			return false
		end
		if slapcount < 2 or slapcount > 200 then
			sampAddChatMessage("[MultiTools] {BEBEBE}Количество пинков от 2 до 200.",0x0099FF)
			return false
		end
	elseif string.match(params,"^%d+") then
		slapcount = string.match(params,"^(%d+)")
		slapcount = tonumber(slapcount)
		if slapcount < 2 or slapcount > 200 then
			sampAddChatMessage("[MultiTools] {BEBEBE}Количество пинков от 2 до 200.",0x0099FF)
			return false
		end
	else
		sampAddChatMessage("[MultiTools] {FFFFFF}Используйте: /slap [пинок] [интервал(необязательно)]",0x0099FF)
		sampAddChatMessage("[MultiTools] {BEBEBE}Необходимо быть в SP режиме, иначе, последствия непредсказуемы!",0x0099FF)
		return false
	end
	
	lua_thread.create(function()
		while slapcount > slaps do
			slaps = slaps+1
			sampSendMenuSelectRow(2)
			wait(delay)
		end
		slaps = nil
		slapcount = nil
		delay = 150
	end)
end

function sampev.onServerMessage(color, text)
	if gcmd == 1 and string.find(text, "Такого игрока нет") then
		gcmd = 0
	end
	if kpzPidora == 1 then
		if string.match(text, "^%[A%] .*_.*%[%d+%] вытащил из тюрьмы "..nickKPZ.."%[%d+%]") then
			local idPidora = tonumber(string.match(text, "^%[A%] .*_.*%[%d+%] вытащил из тюрьмы "..nickKPZ.."%[(%d+)%]"))
			lua_thread.create(function()
				sampAddChatMessage("[debug]", -1)
				wait(3000)
				sampSendChat(string.format("/jail %d 300 обратно", idPidora))
				wait(500)
				sampSendChat("/a Сидеть пока не успокоишься")
			end)
		end
	end	
	if not AFK then 
		if slapcount and string.find(text, "пнул игрока") then
			return false
		end
		
		if earsStatus == 1 then
			if string.match(text, "^%[A%]%[SMS%]: .* %| Отправил " .. PlayerNameEars .. "%[%d+%] для .*%[%d+%]") then
				local textears, id1, nick2, id2 = string.match(text, "^%[A%]%[SMS%]: (.*) %| Отправил " .. PlayerNameEars .. "%[(%d+)%] для (.*)%[(%d+)%]")
				return {color, "{FF0000}[A][SMS]:{FF8C00} " .. textears .. " | Отправил {ff6685}" .. PlayerNameEars .. "[" .. id1 .. "]{FF8C00} для " .. nick2 .. "[" .. id2 .. "]"}
			elseif string.match(text, "^%[A%]%[SMS%]: .* %| Отправил .*%[%d+%] для " .. PlayerNameEars .. "%[%d+%]") then
				local textears, nick2, id2, id1 = string.match(text, "^%[A%]%[SMS%]: (.*) %| Отправил (.*)%[(%d+)%] для " .. PlayerNameEars .. "%[(%d+)%]")
				return {color, "{FF0000}[A][SMS]:{FF8C00} " .. textears .. " | Отправил " .. nick2 .. "[" .. id2 .. "] для {ff6685}" .. PlayerNameEars .. "[" .. id1 .. "]"}
			end
		end
		
		if nickChange == 1 then
			if string.match(text, "[Смена non-rp имени] .*_.* >> .* {99FF33}| /okay %d+ для одобрения") then
				sampAddChatMessage(text,color)
				local plid = tonumber(string.match(text, "[Смена non-rp имени] .*_.* >> .* {99FF33}| /okay (%d+) для одобрения"))
				sampSendChat(string.format("/ans %d Для смены ника РП формата используйте донат (/mn > 9)",plid))
				plid = nil
			end
		end

		if newReport == 1 then 
			if string.match(text,".*%[%d+%] : {FFCD00}.*") then
				local name, id, text = string.match(text,"(.*)%[(%d+)%] : {FFCD00}(.*)")
				id = tonumber(id)
				sampAddChatMessage(string.format("[РЕПОРТ СУКА] {1DF428}%s[%d]:{FFCD00} %s", name, id, text),0xFF0000)
				return false
			end
			
			if string.match(text,"Администратор .*%[%d+%] для .*%[%d+%]: .*") then
				local admname, admid, toName, toID, admAnswer = string.match(text,"Администратор (.*)%[(%d+)%] для (.*)%[(%d+)%]: (.*)")
				admid = tonumber(admid)
				toID = tonumber(toID)
				sampAddChatMessage(string.format("Администратор %s[%d] для %s[%d]:{FFFFFF} %s", admname, admid, toName, toID, admAnswer), 0xD7556F)
				return false
			end	
		end
		
		if smstp == 1 then
			if string.match (text, "^SMS%:%s%/tp%s%|%sОтправитель%:%s.*%[%d+%]") then
				playerTPid = string.match(text,"^SMS%:%s%/tp%s%|%sОтправитель%:%s.*%[(%d+)%]")
			elseif string.match (text, "^SMS%:%s%/tp%s%|%sОтправитель%:%s.*%s%[т.%d+%]") then
				playerTPname = string.match(text,"^SMS%:%s%/tp%s%|%sОтправитель%:%s(.*)%s%[т.%d+%]")
			end
		end
	end
end


function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
	if newTime == 1 then
		if dialogId == 176 and string.find(sampGetCurrentServerName(),"Advance RolePlay") then
			-- Fact online today
			allhour, allmin = string.match(text,"Время в игре сегодня:		{ffcc00}(%d+) ч (%d+) мин")
			afkhour, afkmin = string.match(text,"AFK за сегодня:		{FF7000}(%d+) ч (%d+) мин")
			
			facthour =  allhour - afkhour
			factmin = allmin - afkmin
			
			if string.find(factmin,"-") then
				factmin = factmin + 60
				facthour = facthour - 1
			end

			-- Fact online yesterday
			yallhour, yallmin = string.match(text,"Время в игре вчера:		{ffcc00}(%d+) ч (%d+) мин")
			yafkhour, yafkmin = string.match(text,"AFK за вчера:			{FF7000}(%d+) ч (%d+) мин") 
			
			yfacthour =  yallhour - yafkhour
			yfactmin = yallmin - yafkmin
			
			if string.find(yfactmin,"-") then
				yfactmin = yfactmin + 60
				yfacthour = yfacthour - 1
			end
			
			facthour = tonumber(facthour)
			factmin = tonumber(factmin)
			yfacthour = tonumber(yfacthour)
			yfactmin = tonumber(yfactmin)
			
			if facthour >= 4 then color = "9ACD32" else color = "FF6347" end
			if yfacthour >= 4 then ycolor = "9ACD32" else ycolor = "FF6347" end
			
			sampShowDialog(176,title,string.format("%s\n\n{FFFFFF}Факт сегодня: \t{%s}%d ч %d мин\n{FFFFFF}Факт вчера: \t{%s}%d ч %d мин",text,color,facthour,factmin,ycolor,yfacthour,yfactmin),button1,button2,style)
			
			lua_thread.create(function()
				wait(100)
				sampSendDialogResponse(319, 1)
			end)
			return false
		end
	end
	if gcmd == 1 and string.find(title,"Статистика игрока") then
		local banda = string.match(text,"Организация:(.*)Работа")
		if string.find(banda,"Varios Los Aztecas") then
			out = "Aztec"
		elseif string.find(banda,"The Rifa") then
			out = "Rifa"
		elseif string.find(banda,"Los Santos Vagos") then
			out = "Vagos"
		elseif string.find(banda,"The Ballas") then
			out = "Ballas"
		elseif string.find(banda,"Grove Street") then
			out = "Grove"
		else
			sampAddChatMessage("[MultiTools]:{CECECE} Игрок не состоит в банде.", 0x0099FF)
			gcmd = 0
			return false
		end
		
		if reason == 1 then
			sampAddChatMessage("варн " .. idband .. " " .. prichband .. " • " .. out, 0xCECECE)
		elseif reason == 2 then
			sampAddChatMessage("бан " .. idband .. " " .. dayband .. " " .. prichband .. " • " .. out, 0xCECECE)
		end
		gcmd = 0
		return false
	end
end


function cmd_rel()
	sampAddChatMessage("[MultiTools] {BEBEBE}Скрипт перезагружен!",0x0099FF)
	thisScript():reload()
end
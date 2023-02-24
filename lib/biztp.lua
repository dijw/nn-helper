script_name("Advance Admin")
script_authors("#Maddison")
script_version_number(2)

--local sampev = require 'lib.samp.events'
--require "lib.moonloader"

business_list =
[[
{B40431}1. Казино г.Los-Santos
{FF9900}2. Риелторское агентство
{FF9900}3. Управление статистики
{AFAF00}4. Частный банк в д.Angel Pine
{AFAF00}5. Частный банк в д.Las Barrancas
{AFAF00}6. Частный банк в д.Fort Carson
{5FB404}7. Центральный отель г.Los-Santos
{5FB404}8. Отель "Jefferson"
{5FB404}9. Отель г.San-Fierro
{5FB404}10. Отель в д.El Cobrados
{5FB404}11. Отель в д.Fort Carson
{5FB404}12. Отель в д.Blueberry
{5FB404}13. Пиратский отель в г.Las-Venturas
{5FB404}14. Отель "Visage"
{5FB404}15. Отель г.Las-Venturas
{0099D6}16. Развлекательный центр
{0099D6}17. 24/7 у ТЦЛС
{0099D6}18. Салон красоты в ТЦЛС
{0099D6}19. Магазин одежды в ТЦЛС
{0099D6}19. Садовый центр
{0099D6}20. Автомастерская г.San-Fierro
]]


function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	
	sampRegisterChatCommand("btp",cmd_btp)
	
	while true do
		wait(0)
		local result, button, listitem = sampHasDialogRespond(50)
		if(result) then
			gotoBusiness(listitem,button)
		end
	end
end

function cmd_btp()
    sampShowDialog(50, "{FFFF00}Список бизнесов", business_list, "Телепорт", "Закрыть", 2)
end

function gotoBusiness(id,bt)
	if bt == 1 then
		if id == 0 then 
			sampSendChat("/setvw 22")
			sampSendChat("/inter 68")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Казино г.Los-Santos.",0x0099FF)
		end
		if id == 1 then 
			sampSendChat("/setvw 44")
			sampSendChat("/inter 76")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Риелторское агентство.",0x0099FF)
		end
		if id == 2 then 
			sampSendChat("/setvw 46")
			sampSendChat("/inter 66")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Управление статистики.",0x0099FF)
		end
		if id == 3 then 
			sampSendChat("/setvw 88")
			sampSendChat("/inter 76")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Частный банк в д.Angel Pine.",0x0099FF)
		end
		if id == 4 then 
			sampSendChat("/setvw 145")
			sampSendChat("/inter 76")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Частный банк в д.Las Barrancas.",0x0099FF)
		end
		if id == 5 then 
			sampSendChat("/setvw 152")
			sampSendChat("/inter 76")
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Частный банк в д.Fort Carson.",0x0099FF)
		end
		if id == 6 then 
			sampSendChat("/setvw 48")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Центральный отель г.Los-Santos.",0x0099FF)
		end
		if id == 7 then 
			sampSendChat("/setvw 54")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Отель \"Jefferson\".",0x0099FF)
		end
		if id == 8 then 
			sampSendChat("/setvw 118")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Отель г.San-Fierro.",0x0099FF)
		end
		if id == 9 then 
			sampSendChat("/setvw 138")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Отель в д.El Cobrados.",0x0099FF)
		end
		if id == 10 then 
			sampSendChat("/setvw 158")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Отель в д.Fort Carson.",0x0099FF)
		end
		if id == 11 then 
			sampSendChat("/setvw 225")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Отель в д.Blueberry.",0x0099FF)
		end
		if id == 12 then 
			sampSendChat("/setvw 233")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Пиратский отель в г.Las-Venturas.",0x0099FF)
		end
		if id == 13 then 
			sampSendChat("/setvw 232")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Отель \"Visage\".",0x0099FF)
		end
		if id == 14 then 
			sampSendChat("/setvw 172")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Отель г.Las-Venturas.",0x0099FF)
		end
		if id == 15 then 
			sampSendChat("/setvw 42")
			sampSendChat("/inter 47")
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Развлекательный центр.",0x0099FF)
		end
		if id == 16 then 
			sampSendChat("/setvw 38")
			sampSendChat("/inter 78")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}24/7 у ТЦЛС.",0x0099FF)
		end
		if id == 17 then 
			sampSendChat("/setvw 37")
			sampSendChat("/inter 50")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Салон красоты в ТЦЛС.",0x0099FF)
		end
		if id == 18 then 
			sampSendChat("/setvw 39")
			sampSendChat("/inter 67")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Магазин одежды в ТЦЛС.",0x0099FF)
		end
		if id == 19 then 
			sampSendChat("/setvw 99")
			sampSendChat("/inter 4")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Садовый центр.",0x0099FF)
		end
		if id == 20 then 
			sampSendChat("/setvw 113")
			sampSendChat("/inter 4")
			wait(500)
			sampAddChatMessage("> {FFFFFF}Вы телепортированы в {0099FF}Автомастерскую SF.",0x0099FF)
		end		
	end
end
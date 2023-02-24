script_name("Advance Admin")
script_authors("#Maddison")
script_version_number(2)

--local sampev = require 'lib.samp.events'
--require "lib.moonloader"

business_list =
[[
{B40431}1. ������ �.Los-Santos
{FF9900}2. ����������� ���������
{FF9900}3. ���������� ����������
{AFAF00}4. ������� ���� � �.Angel Pine
{AFAF00}5. ������� ���� � �.Las Barrancas
{AFAF00}6. ������� ���� � �.Fort Carson
{5FB404}7. ����������� ����� �.Los-Santos
{5FB404}8. ����� "Jefferson"
{5FB404}9. ����� �.San-Fierro
{5FB404}10. ����� � �.El Cobrados
{5FB404}11. ����� � �.Fort Carson
{5FB404}12. ����� � �.Blueberry
{5FB404}13. ��������� ����� � �.Las-Venturas
{5FB404}14. ����� "Visage"
{5FB404}15. ����� �.Las-Venturas
{0099D6}16. ��������������� �����
{0099D6}17. 24/7 � ����
{0099D6}18. ����� ������� � ����
{0099D6}19. ������� ������ � ����
{0099D6}19. ������� �����
{0099D6}20. �������������� �.San-Fierro
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
    sampShowDialog(50, "{FFFF00}������ ��������", business_list, "��������", "�������", 2)
end

function gotoBusiness(id,bt)
	if bt == 1 then
		if id == 0 then 
			sampSendChat("/setvw 22")
			sampSendChat("/inter 68")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}������ �.Los-Santos.",0x0099FF)
		end
		if id == 1 then 
			sampSendChat("/setvw 44")
			sampSendChat("/inter 76")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}����������� ���������.",0x0099FF)
		end
		if id == 2 then 
			sampSendChat("/setvw 46")
			sampSendChat("/inter 66")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}���������� ����������.",0x0099FF)
		end
		if id == 3 then 
			sampSendChat("/setvw 88")
			sampSendChat("/inter 76")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}������� ���� � �.Angel Pine.",0x0099FF)
		end
		if id == 4 then 
			sampSendChat("/setvw 145")
			sampSendChat("/inter 76")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}������� ���� � �.Las Barrancas.",0x0099FF)
		end
		if id == 5 then 
			sampSendChat("/setvw 152")
			sampSendChat("/inter 76")
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}������� ���� � �.Fort Carson.",0x0099FF)
		end
		if id == 6 then 
			sampSendChat("/setvw 48")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}����������� ����� �.Los-Santos.",0x0099FF)
		end
		if id == 7 then 
			sampSendChat("/setvw 54")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}����� \"Jefferson\".",0x0099FF)
		end
		if id == 8 then 
			sampSendChat("/setvw 118")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}����� �.San-Fierro.",0x0099FF)
		end
		if id == 9 then 
			sampSendChat("/setvw 138")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}����� � �.El Cobrados.",0x0099FF)
		end
		if id == 10 then 
			sampSendChat("/setvw 158")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}����� � �.Fort Carson.",0x0099FF)
		end
		if id == 11 then 
			sampSendChat("/setvw 225")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}����� � �.Blueberry.",0x0099FF)
		end
		if id == 12 then 
			sampSendChat("/setvw 233")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}��������� ����� � �.Las-Venturas.",0x0099FF)
		end
		if id == 13 then 
			sampSendChat("/setvw 232")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}����� \"Visage\".",0x0099FF)
		end
		if id == 14 then 
			sampSendChat("/setvw 172")
			sampSendChat("/inter 86")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}����� �.Las-Venturas.",0x0099FF)
		end
		if id == 15 then 
			sampSendChat("/setvw 42")
			sampSendChat("/inter 47")
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}��������������� �����.",0x0099FF)
		end
		if id == 16 then 
			sampSendChat("/setvw 38")
			sampSendChat("/inter 78")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}24/7 � ����.",0x0099FF)
		end
		if id == 17 then 
			sampSendChat("/setvw 37")
			sampSendChat("/inter 50")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}����� ������� � ����.",0x0099FF)
		end
		if id == 18 then 
			sampSendChat("/setvw 39")
			sampSendChat("/inter 67")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}������� ������ � ����.",0x0099FF)
		end
		if id == 19 then 
			sampSendChat("/setvw 99")
			sampSendChat("/inter 4")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}������� �����.",0x0099FF)
		end
		if id == 20 then 
			sampSendChat("/setvw 113")
			sampSendChat("/inter 4")
			wait(500)
			sampAddChatMessage("> {FFFFFF}�� ��������������� � {0099FF}�������������� SF.",0x0099FF)
		end		
	end
end
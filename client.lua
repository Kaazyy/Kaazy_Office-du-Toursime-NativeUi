print("test")

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        for i = 1, #v.LegalPos, 1 do

            local hash = GetHashKey("s_f_y_airhostess_01")
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Wait(20)
            end

            ped = CreatePed("PED_TYPE_CIVMALE", "s_f_y_airhostess_01", v.LegalPos[i].x, v.LegalPos[i].y, v.LegalPos[i].z, v.LegalPos[i].angle, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
        end

    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        for i = 1, #v.LegalPos, 1 do
            local blip = AddBlipForCoord(v.LegalPos[i].x, v.LegalPos[i].y, v.LegalPos[i].z)

            SetBlipSprite (blip, 525)
            SetBlipScale  (blip, 0.7)
            SetBlipColour (blip, 0)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Office du Tourisme')
            EndTextCommandSetBlipName(blip)
         end
     end
end)

_menuPool = NativeUI.CreatePool()
legalmenu = NativeUI.CreateMenu("Office du Tourisme","~w~Bievenue à l'~g~Office du Toursime ~w~!")
_menuPool:Add(legalmenu)

function AddLegalMenu(menu)

    local metiermenu = _menuPool:AddSubMenu(menu, "Renseignements sur les Métiers", "Voir les renseignements sur les ~g~Métiers~w~.")
    metiermenu.Item:RightLabel("→→")

    local etatmenu = _menuPool:AddSubMenu(menu, "Renseignements sur l'Etat", "Voir les renseignements sur l'~g~Etat~w~.")
    etatmenu.Item:RightLabel("→→")
    

    
    local mecano = NativeUI.CreateItem("Mécano", "Voir la position du ~g~Mécano~w~.")
    metiermenu.SubMenu:AddItem(mecano)

    local concessionnaire = NativeUI.CreateItem("Concessionnaire", "Voir la position du ~g~Concessionnaire~w~.")
    metiermenu.SubMenu:AddItem(concessionnaire)

    local annuler = NativeUI.CreateItem("Annuler", "Annuler la position ~g~GPS~w~.")
    metiermenu.SubMenu:AddItem(annuler)


    local parking = NativeUI.CreateItem("Parking Central", "Voir la position du ~g~Parking Central~w~.")
    etatmenu.SubMenu:AddItem(parking)

    local gouvernement = NativeUI.CreateItem("Gouvernement", "Voir la position du ~g~Gouvernement~w~.")
    etatmenu.SubMenu:AddItem(gouvernement)

    local lspd = NativeUI.CreateItem("Commissariat", "Voir la position du ~g~Comissariat~w~.")
    etatmenu.SubMenu:AddItem(lspd)

    local annuler2 = NativeUI.CreateItem("Annuler", "Annuler la position ~g~GPS~w~.")
    etatmenu.SubMenu:AddItem(annuler2)


    metiermenu.SubMenu.OnItemSelect = function(menu, item)
        if item == mecano then

            SetNewWaypoint(-215.84, -1319.09, 30.89)

            PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)

            ESX.ShowAdvancedNotification("Office du Toursime", "Position GPS ~g~effectuée", "", "CHAR_MOLLY", 1)

            Citizen.Wait(1)

        elseif item == concessionnaire then

            SetNewWaypoint(-29.99, -1104.84, 26.41)

            PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)

            ESX.ShowAdvancedNotification("Office du Toursime", "Position GPS ~g~effectuée", "", "CHAR_MOLLY", 1)

            Citizen.Wait(1)

        elseif item == annuler then

            SetNewWaypoint(238.3, -404.3, 46.92)

            PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)

            ESX.ShowAdvancedNotification("Office du Toursime", "Position GPS ~g~annulée", "", "CHAR_MOLLY", 1)

            Citizen.Wait(1)
    	end
    end

    etatmenu.SubMenu.OnItemSelect = function(menu, item)
        if item == parking then

            SetNewWaypoint(215.8, -810.07, 30.73)

            PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)

            ESX.ShowAdvancedNotification("Office du Toursime", "Position GPS ~g~effectuée", "", "CHAR_MOLLY", 1)

            Citizen.Wait(1)

        elseif item == gouvernement then

            SetNewWaypoint(-545.49, -203.59, 38.21)

            PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)

            ESX.ShowAdvancedNotification("Office du Toursime", "Position GPS ~g~effectuée", "", "CHAR_MOLLY", 1)

            Citizen.Wait(1)

        elseif item == lspd then

            SetNewWaypoint(-1098.31, -830.7, 4.88)

            PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)

            ESX.ShowAdvancedNotification("Office du Toursime", "Position GPS ~g~effectuée", "", "CHAR_MOLLY", 1)

            Citizen.Wait(1)

        elseif item == annuler2 then

            SetNewWaypoint(238.3, -404.3, 46.92)

            PlaySoundFrontend( -1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 1)

            ESX.ShowAdvancedNotification("Office du Toursime", "Position GPS ~g~annulée", "", "CHAR_MOLLY", 1)

            Citizen.Wait(1)
    	end
    end
    
        
end


AddLegalMenu(legalmenu)
_menuPool:RefreshIndex()




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false)

        for k,v in pairs(Config.Zones) do

            for i = 1, #v.LegalPos, 1 do
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.LegalPos[i].x, v.LegalPos[i].y, v.LegalPos[i].z, true)
                if distance < 2.2 then
                    alert('Appuyez sur ~INPUT_CONTEXT~ pour intéragir \navec ~g~l\'Office du Toursime~w~.')
                    if IsControlJustPressed(1,51) then
                        legalmenu:Visible(not legalmenu:Visible())
                    end
                end
            end

        end
    end
end)

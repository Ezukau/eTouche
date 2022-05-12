ESX = nil Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)  Citizen.Wait(0) end end)

local open = false
local Main = RageUI.CreateMenu(Config.Menu.NomMenu, Config.Menu.DescriptionMenu, nil, nil, 'root_cause5', Config.Menu.Banner)


Main.Closed = function()
  RageUI.Visible(Main, false)
  main = false
end


function OpenMenu()

  if main then 
    main = false
    RageUI.Visible(Main, false)
    return
  else
    main = true 
    RageUI.Visible(Main, true)
    Citizen.CreateThread(function()
    while main do 
  RageUI.IsVisible(Main,function()
    for k,v in pairs(Config.ConfigurationDesTouche) do
      RageUI.Button("~"..Config.Menu.CouleurMenu.."~→~s~ "..v.touche, v.description, {RightLabel = "~"..Config.Menu.CouleurMenu.."~[ ~s~"..v.action.."~"..Config.Menu.CouleurMenu.."~ ]~s~"}, true, {
        onSelected = function()

        end
      })
    end

      end)

    Wait(0)
  end
end)
end
end      

TriggerEvent('chat:addSuggestion', '/' .. Config.Commande.Nom, Config.Commande.Description, nil)
RegisterCommand(Config.Commande.Nom,function()
	OpenMenu()
end)
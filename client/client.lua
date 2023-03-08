ESX = exports.es_extended:getSharedObject()
 
RegisterKeyMapping("veh", _U('Vehicle_management'), "keyboard", "i")

RegisterCommand("veh", function () 

    local playerPed = PlayerPedId() 
    local vehicle = GetVehiclePedIsIn(playerPed, true)  
    
    if IsPedInAnyVehicle(playerPed,  false) then
        opencontrol() 
    else
        exports["esx_notify"]:Notify("error", 3000, _U('not_inside_veh'))
    end
end, false)
 
function opencontrol() 
    local elements = {
      {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')},
      {title =  _U('engine'),icon = "fa-brands fa-searchengin", value = "engine"},  
      {title =  _U('trunk'),icon = "fas fa-car-side", value = "trunk"},  
      {title =  _U('hood'),icon = "fas fa-car-side", value = "enginetrunk"},  
      {title =  _U('Door'),icon = "fas fa-door-closed", value = "door"},  
      {title =  _U('window'),icon = "fas fa-window-maximize", value = "windonw"},  
      {title =  _U('seat'),icon = "fas fa-wheelchair", value = "place"}, 
      {title =  _U('Speed_limiter'),icon = "fas fa-gauge", value = "limit"},  
  }

  ESX.OpenContext("right", elements, function(menu,element)
    if element.value == "engine" then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
            SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
        end
    elseif element.value == "trunk" then       
      opencontrol2() 
      
    elseif element.value == "enginetrunk" then       
        opencontrol3()
        
    elseif element.value == "door" then       
        opendoorL1()
  
    elseif element.value == "windonw" then   
        windown()
    elseif element.value == "place" then    
        place()
    elseif element.value == "limit" then    
        
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
 
        local elements14 = {
            {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')},
            {icon = "fas fa-list-ol", title = _U('speed'), input = true, inputType = "number", inputMin = 0, inputMax = 9999999, inputPlaceholder = _U('MPH')},
            {icon = "fas fa-check-double", title = _U('confirm'), value = "confirm"},
            {icon = "fas fa-check-double", title = _U('relimit'), value = "relimit"},
            
        }
        ESX.OpenContext("right", elements14, function(menu14,elements14)
            
            local amount = tonumber(menu14.eles[2].inputValue)
            if amount == nil then    
                ESX.CloseContext()
            else
                SetVehicleMaxSpeed(vehicle, amount*1000/2250)
                ESX.CloseContext()
            end
            if elements14.value == "relimit" then 
                SetVehicleMaxSpeed(vehicle, 0.0) 
            end
        end)
    end    
    end)
 

end   
function opencontrol2()

    local elements2 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('open'),icon = "fas fa-car-side", value = "opentrunk"},  
        {title = _U('close'),icon = "fas fa-car-side", value = "closetrunk"},  
        {title = _U('retunr'),icon = "fas fa-car-side", value = "retunr"},  
        }
        ESX.OpenContext("right", elements2, function(menu2,elements2)
            if elements2.value == "opentrunk" then 
                    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())   
                    SetVehicleDoorOpen(Vehicle, 5, false, false)      
            elseif elements2.value == "closetrunk"   then
                local Vehicle = GetVehiclePedIsUsing(PlayerPedId()) 
                SetVehicleDoorShut(Vehicle, 5, false) 
            elseif elements2.value == "retunr" then
                opencontrol()    
            end
        end)

end    
function opencontrol3()

    local elements3 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('open'),icon = "fas fa-car-side", value = "openenginetrunk"},  
        {title = _U('close'),icon = "fas fa-car-side", value = "closeenginetrunk"},  
        {title = _U('retunr'),icon = "fas fa-car-side", value = "retunr"},  
        }
        ESX.OpenContext("right", elements3, function(menu3,elements3)
            if elements3.value == "openenginetrunk" then 
                    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())   
                    SetVehicleDoorOpen(Vehicle, 4, false, false)      
            elseif elements3.value == "closeenginetrunk"   then
                local Vehicle = GetVehiclePedIsUsing(PlayerPedId()) 
                SetVehicleDoorShut(Vehicle, 4, false) 
            elseif elements3.value == "retunr" then
                opencontrol() 
            end
        end)

end      
function opendoorL1()
    local elements4 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('door_l'),icon = "fas fa-door-closed", value = "doorl"},   
        {title = _U('door_r'),icon = "fas fa-door-closed", value = "doorl2"},   
        {title = _U('door_ll'),icon = "fas fa-door-closed", value = "doorl3"},   
        {title = _U('door_rr'),icon = "fas fa-door-closed", value = "doorl4"},  
        {title = _U('retunr'),icon = "fas fa-car-side", value = "retunr"},  
        }
        ESX.OpenContext("right", elements4, function(menu4,elements4)
            if elements4.value == "doorl" then 
                opencontrol4()
            elseif elements4.value == "doorl2" then 
                opencontrol5() 
                
            elseif elements4.value == "doorl3" then 
                opencontrol6()
                
            elseif elements4.value == "doorl4" then 
                opencontrol7()
                
            elseif elements4.value == "retunr" then
                opencontrol() 
            end
        end)
    
end
function opencontrol4()

    local elements5 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('open'),icon = "fas fa-door-closed", value = "openedoor"},  
        {title = _U('close'),icon = "fas fa-door-closed", value = "closedoor"},  
        {title = _U('retunr'),icon = "fas fa-car-side", value = "retunr"},  
        }
        ESX.OpenContext("right", elements5, function(menu5,elements5)
            if elements5.value == "openedoor" then 
                    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())   
                    SetVehicleDoorOpen(Vehicle, 0, false, false)      
            elseif elements5.value == "closedoor"   then
                local Vehicle = GetVehiclePedIsUsing(PlayerPedId()) 
                SetVehicleDoorShut(Vehicle, 0, false) 
            elseif elements5.value == "retunr" then
                opendoorL1()
            end
        end)

end    
function opencontrol5()

    local elements6 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('open'),icon = "fas fa-door-closed", value = "openedoor"},  
        {title = _U('close'),icon = "fas fa-door-closed", value = "closedoor"},  
        {title = _U('retunr'),icon = "fas fa-car-side", value = "retunr"},  
        }
        ESX.OpenContext("right", elements6, function(menu6,elements6)
            if elements6.value == "openedoor" then 
                    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())   
                    SetVehicleDoorOpen(Vehicle, 1, false, false)      
            elseif elements6.value == "closedoor"   then
                local Vehicle = GetVehiclePedIsUsing(PlayerPedId()) 
                SetVehicleDoorShut(Vehicle, 1, false) 
            elseif elements6.value == "retunr" then
                opendoorL1()
            end
        end)

end  
function opencontrol6()

    local elements7 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('open'),icon = "fas fa-door-closed", value = "openedoor"},  
        {title = _U('close'),icon = "fas fa-door-closed", value = "closedoor"},  
        {title = _U('retunr'),icon = "fas fa-car-side", value = "retunr"},  
        }
        ESX.OpenContext("right", elements7, function(menu7,elements7)
            if elements7.value == "openedoor" then 
                    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())   
                    SetVehicleDoorOpen(Vehicle, 2, false, false)      
            elseif elements7.value == "closedoor"   then
                local Vehicle = GetVehiclePedIsUsing(PlayerPedId()) 
                SetVehicleDoorShut(Vehicle, 2, false) 
            elseif elements7.value == "retunr" then
                opendoorL1()
            end
        end)

end  

function opencontrol7()

    local elements8 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('open'),icon = "fas fa-door-closed", value = "openedoor"},  
        {title = _U('close'),icon = "fas fa-door-closed", value = "closedoor"},  
        {title = _U('retunr'),icon = "fas fa-car-side", value = "retunr"},  
        }
        ESX.OpenContext("right", elements8, function(menu8,elements8)
            if elements8.value == "openedoor" then 
                    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())   
                    SetVehicleDoorOpen(Vehicle, 3, false, false)      
            elseif elements8.value == "closedoor"   then
                local Vehicle = GetVehiclePedIsUsing(PlayerPedId()) 
                SetVehicleDoorShut(Vehicle, 3, false) 
            elseif elements8.value == "retunr" then
                opendoorL1()
            end
        end)

end  
function windown()

    local elements9 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('windown_l'),icon = "fas fa-window-maximize", value = "widonw1"},  
        {title = _U('windown_r'),icon = "fas fa-window-maximize", value = "widonw2"},  
        {title = _U('windown_ll'),icon = "fas fa-window-maximize", value = "widonw3"}, 
        {title = _U('windown_rr'),icon = "fas fa-window-maximize", value = "widonw4"},  
        {title = _U('retunr'),icon = "fas fa-car-side", value = "retunr"},  
        }
        ESX.OpenContext("right", elements9, function(menu9,elements9)
            if elements9.value == "widonw1" then  
                windown1()
            elseif elements9.value == "widonw2"   then  
                windown2()
            elseif elements9.value == "widonw3"   then  
                windown3()
            elseif elements9.value == "widonw4"   then  
                windown4()
            elseif elements9.value == "retunr" then
                opencontrol() 
            end
        end)
end  

function windown1()

    local elements10 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('open'),icon = "fas fa-window-maximize", value = "widonw1open"},  
        {title = _U('close'),icon = "fas fa-window-maximize", value = "widonw1close"},  
        {title = _U('retunr'),icon = "fas fa-window-maximize", value = "retunr"},  
        }
        ESX.OpenContext("right", elements10, function(menu10,elements10)
            if elements10.value == "widonw1open" then 
                    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())    
                    
                    RollDownWindow(Vehicle, 0)
            elseif elements10.value == "widonw1close"   then 
                local Vehicle = GetVehiclePedIsUsing(PlayerPedId())    

                RollUpWindow(Vehicle, 0)
            elseif elements10.value == "retunr" then
                windown()
            end
        end)
end  
function windown2()

    local elements11 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('open'),icon = "fas fa-window-maximize", value = "widonw2open"},  
        {title = _U('close'),icon = "fas fa-window-maximize", value = "widonw2close"},  
        {title = _U('retunr'),icon = "fas fa-window-maximize", value = "retunr"},  
        }
        ESX.OpenContext("right", elements11, function(menu11,elements11)
            if elements11.value == "widonw2open" then 
                    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())    
                    
                    RollDownWindow(Vehicle, 1)
            elseif elements11.value == "widonw2close"   then 
                local Vehicle = GetVehiclePedIsUsing(PlayerPedId())    

                RollUpWindow(Vehicle, 1)
            elseif elements11.value == "retunr" then
                windown()
            end
        end)
end  
function windown3()

    local elements12 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('open'),icon = "fas fa-window-maximize", value = "widonw3open"},  
        {title = _U('close'),icon = "fas fa-window-maximize", value = "widonw3close"},  
        {title = _U('retunr'),icon = "fas fa-window-maximize", value = "retunr"},  
        }
        ESX.OpenContext("right", elements12, function(menu12,elements12)
            if elements12.value == "widonw3open" then 
                    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())    
                    
                    RollDownWindow(Vehicle, 2)
            elseif elements12.value == "widonw3close"   then 
                local Vehicle = GetVehiclePedIsUsing(PlayerPedId())    

                RollUpWindow(Vehicle, 2)
            elseif elements12.value == "retunr" then
                windown()
            end
        end)
end  
function windown4()

    local elements13 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('open'),icon = "fas fa-window-maximize", value = "widonw4open"},  
        {title = _U('close'),icon = "fas fa-window-maximize", value = "widonw4close"},  
        {title = _U('retunr'),icon = "fas fa-window-maximize", value = "retunr"},  
        }
        ESX.OpenContext("right", elements13, function(menu13,elements13)
            if elements13.value == "widonw4open" then 
                    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())    
                    
                    RollDownWindow(Vehicle, 3)
            elseif elements13.value == "widonw4close"   then 
                local Vehicle = GetVehiclePedIsUsing(PlayerPedId())    

                RollUpWindow(Vehicle, 3)
            elseif elements13.value == "retunr" then
                windown()
            end
        end)
end  

function place()

    local elements14 = {
        {unselectable = true, icon = "fas fa-car-side", title = _U('Vehicle_management')}, 
        {title = _U('master_driving'),icon = "fas fa-wheelchair", value = "place1"},  
        {title = _U('co_driver'),icon = "fas fa-wheelchair", value = "place2"},  
        {title = _U('master_drivingg'),icon = "fas fa-wheelchair", value = "place3"}, 
        {title = _U('co_driverr'),icon = "fas fa-wheelchair", value = "place4"},  
        {title = _U('retunr'),icon = "fas fa-car-side", value = "retunr"},  
        }
        ESX.OpenContext("right", elements14, function(menu14,elements14)
            if elements14.value == "place1" then  
                place1()
            elseif elements14.value == "place2"   then  
                place2()
            elseif elements14.value == "place3"   then  
                place3()
            elseif elements14.value == "place4"   then  
                place4()
            elseif elements14.value == "retunr" then
                opencontrol() 
            end
        end)
end        

function place1()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetPedIntoVehicle(ped, vehicle, -1)
end    

function place2()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetPedIntoVehicle(ped, vehicle, 0)
end    

function place3()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetPedIntoVehicle(ped, vehicle, 1)
end    

function place4()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetPedIntoVehicle(ped, vehicle, 2)
end    
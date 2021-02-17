function player_connected(player)

    print("Player connected: " .. player.name)
    player:onnotifyonce("spawned_player", function() player_spawned(player) 
    
    end)
    game:executecommand("sv_cheats 1")

end

function player_spawned(player)

    player:freezecontrols(false) -- unfreeze controls

    welcomeMSG_timer(player)

    -- initiate player notifies
    player:notifyonplayercommand("attack", "+attack")
    player:notifyonplayercommand("ads", "+speed_throw")
    player:notifyonplayercommand("jump", "+gostand")
    player:notifyonplayercommand("forward", "+forward")
    player:notifyonplayercommand("backward", "+back")
    player:notifyonplayercommand("actionslot 4", "+actionslot 4")
    player:notifyonplayercommand("use", "+activate")
    player:notifyonplayercommand("frag", "+frag")
    player:notifyonplayercommand("smoke", "+smoke")
    player:notifyonplayercommand("melee", "+melee_zoom")

    -- initiate menu controls
    player:onnotify("attack", function() menuDown(player) -- menu scroll down 

    end)
    player:onnotify("ads", function() menuUp(player) -- menu scroll up 

    end)
    player:onnotify("jump", function() menuSelect(player) -- menu select option

    end)
    player:onnotify("melee", function() menuClose(player) -- close menu or sub menu 

    end)
    player:onnotify("actionslot 4", function() init_menu(player) -- open menu

    end)
    player:onnotify("smoke", function() test(player)

    end)

end

function welcomeMSG_timer(player)

    local timer = game:oninterval(function() client_printlnbold(player, "Welcome to ^:Menu Base^7 by Lurkzy") end, 1000)
    local timer1 = game:oninterval(function() timer:clear() end, 1000)
    
    local timer2 = game:oninterval(function() client_printlnbold(player, "Press ^:Crouch ^7and ^:[{+Actionslot 4}] ^7to open the menu") end, 4000)
    local timer2_1 = game:oninterval(function() timer2:clear() end, 4000)

    local timer3 = game:oninterval(function() client_printlnbold(player, "If you use this menu base please ^:credit me ^7<3 <3") end, 7000)
    local timer3_1 = game:oninterval(function() timer3:clear() end, 7000)

end

function client_printlnbold(player, message)

    player:iprintlnbold(message)
    
end

-- include other menu files
include ("__base")
include ("__functions")
include ("__utilities")

level:onnotify("connected", player_connected)
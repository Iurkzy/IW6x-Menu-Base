
local Main = { "Main Mods", "Submenu 2", "Submenu 3", "Submenu 4", "Submenu 5", "Submenu 6", "Submenu 7", "Submenu 8", "Submenu 9", "Submenu 10" }
local Submenu1 = { "God Mode", "Noclip", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8", "Option 9", "Option 10" }

local cycle = 1;
local menu = "";
local parent = "";
local menuisOpen = false;

function init_menu(player)

    if player:ishost() then

        if menuisOpen == false then

            if player:getstance() == "crouch" then

                menu = "main";                          -- set menu name
                createHud(player, menu)                 -- create new hud
                player:setblurforplayer(7, 0.5)         -- set world blur to 7
                menuisOpen = true;                      -- menu is open bool

                closeMenuOnDeath(player)                -- activate watch for player death notify

            end

        end
    elseif isVerified == true then

        if menuisOpen == false then

            if player:getstance() == "crouch" then
                
                menu = "main";
                createHud(player, menu)
                player:setblurforplayer(7, 0.5)
                player:freezecontrols(true)
                menuisOpen = true;

                closeMenuOnDeath(player)

            end

        end

    end
end

function closeMenuOnDeath(player)

    player:onnotifyonce("death", function() MenuDie(player) end) -- watch for player death

end

function MenuDie(player)

    cycle = 1;                              -- set menu cycle to 1
    player:notify("changeMenu");            -- notify the menu is being changed
    player:setblurforplayer(0, 0);          -- set world blur to zero
    menuisOpen = false;                     -- menu is open bool
    player:freezecontrols(false)            -- unfreeze controls if frozen

end

function menuDown(player)
    
    if menuisOpen == true then

        player:notify("changeMenu");        -- notify the menu is being changed
        menuMonitorDown(player)             -- monitor scoller position down
        menuOptions(player)                 -- update menu options and scroller

    end

end

function menuUp(player)

    if menuisOpen then

        player:notify("changeMenu");        -- notify the menu is being changed
        menuMonitorUp(player)               -- monitor scoller position up
        menuOptions(player)                 -- update menu options and scroller

    end

end

function menuClose(player)

    if menuisOpen then

        if menu == "main" then

            cycle = 1;
            player:notify("changeMenu");            -- notify the menu is being changed
            player:setblurforplayer(0, 0);          -- set world blur to zero
            menuisOpen = false;                     -- menu is open bool

        elseif menu == "submenu1" then

            cycle = 1;                          -- set menu cycle to 1
            menu = "main";                      -- set menu name
            player:notify("changeMenu")         -- notify the menu is being changed
            createHud(player, menu)             -- create new hud

        end

    end
end

function menuSelect(player)

    if menuisOpen == true then

        if menu == "main" then

            if cycle == 1 then

                menu = "submenu1";              -- set menu name
                player:notify("changeMenu")     -- notify the menu is being changed
                createHud(player, menu)         -- create the new menu hud
                cycle = 1;         
            else

                player:iprintln("^:Test!") -- activate function             -- set cycle to 1

            end

        elseif menu == "submenu1" then

            if cycle == 1 then

                godmode(player) -- activate function

            elseif cycle == 2 then
    
                noclip(player) -- activate function

            else

                player:iprintln("^:Test!") -- activate function

            end

        else

            player:iprintln("^:Test!") -- activate function

        end

    end
end

function menuMonitorDown(player)

    if menu == "main" then
        
        if cycle == 1 then

            cycle = 2;

        elseif cycle == 2 then

            cycle = 3;

        elseif cycle == 3 then

            cycle = 4;

        elseif cycle == 4 then

            cycle = 5;

        elseif cycle == 5 then

            cycle = 6;

        elseif cycle == 6 then

            cycle = 7;

        elseif cycle == 7 then

            cycle = 8;

        elseif cycle == 8 then

            cycle = 9;

        elseif cycle == 9 then

            cycle = 10;

        elseif cycle == 10 then

            cycle = 1;

        end
    elseif menu == "submenu1" then

        if cycle == 1 then

            cycle = 2;

        elseif cycle == 2 then

            cycle = 3;

        elseif cycle == 3 then

            cycle = 4;

        elseif cycle == 4 then

            cycle = 5;

        elseif cycle == 5 then

            cycle = 6;

        elseif cycle == 6 then

            cycle = 7;

        elseif cycle == 7 then

            cycle = 8;

        elseif cycle == 8 then

            cycle = 9;

        elseif cycle == 9 then

            cycle = 10;

        elseif cycle == 10 then

            cycle = 1;

        end
    end
end

function menuMonitorUp(player)

    if menu == "main" then

        if cycle == 10 then

            cycle = 9;

        elseif cycle == 9 then

            cycle = 8;

        elseif cycle == 8 then

            cycle = 7;

        elseif cycle == 7 then

            cycle = 6;

        elseif cycle == 6 then

            cycle = 5;

        elseif cycle == 5 then

            cycle = 4;

        elseif cycle == 4 then

            cycle = 3;

        elseif cycle == 3 then

            cycle = 2;

        elseif cycle == 2 then

            cycle = 1;

        elseif cycle == 1 then

            cycle = 10;

        end
    elseif menu == "submenu1" then

        if cycle == 10 then

            cycle = 9;

        elseif cycle == 9 then

            cycle = 8;

        elseif cycle == 8 then

            cycle = 7;

        elseif cycle == 7 then

            cycle = 6;

        elseif cycle == 6 then

            cycle = 5;
            
        elseif cycle == 5 then

            cycle = 4;

        elseif cycle == 4 then

            cycle = 3;

        elseif cycle == 3 then

            cycle = 2;

        elseif cycle == 2 then

            cycle = 1;

        elseif cycle == 1 then

            cycle = 10;

        end
    end
end


function menuOptions(player)

    if menu == "main" then

        if cycle == 1 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(2, "big", 0, -140, 0, "center", "center", "middle", 1, "^:"..Main[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Main[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Main[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Main[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Main[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Main[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Main[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Main[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Main[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Main[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)


        elseif cycle == 2 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Main[1], 1);
            local option2 = create_TextElement(2, "big", 0, -120, 0, "center", "center", "middle", 1, "^:"..Main[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Main[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Main[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Main[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Main[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Main[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Main[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Main[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Main[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)



        elseif cycle == 3 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Main[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Main[2], 1);
            local option3 = create_TextElement(2, "big", 0, -100, 0, "center", "center", "middle", 1, "^:"..Main[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Main[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Main[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Main[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Main[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Main[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Main[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Main[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)



        elseif cycle == 4 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Main[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Main[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Main[3], 1);
            local option4 = create_TextElement(2, "big", 0, -80, 0, "center", "center", "middle", 1, "^:"..Main[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Main[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Main[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Main[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Main[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Main[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Main[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)



        elseif cycle == 5 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Main[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Main[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Main[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Main[4], 1);
            local option5 = create_TextElement(2, "big", 0, -60, 0, "center", "center", "middle", 1, "^:"..Main[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Main[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Main[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Main[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Main[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Main[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)



        elseif cycle == 6 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Main[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Main[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Main[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Main[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Main[5], 1);
            local option6 = create_TextElement(2, "big", 0, -40, 0, "center", "center", "middle", 1, "^:"..Main[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Main[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Main[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Main[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Main[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)



        elseif cycle == 7 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Main[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Main[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Main[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Main[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Main[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Main[6], 1);
            local option7 = create_TextElement(2, "big", 0, -20, 0, "center", "center", "middle", 1, "^:"..Main[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Main[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Main[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Main[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)



        elseif cycle == 8 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Main[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Main[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Main[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Main[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Main[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Main[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Main[7], 1);
            local option8 = create_TextElement(2, "big", 0, 0, 0, "center", "center", "middle", 1, "^:"..Main[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Main[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Main[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)



        elseif cycle == 9 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Main[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Main[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Main[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Main[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Main[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Main[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Main[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Main[8], 1);
            local option9 = create_TextElement(2, "big", 0, 20, 0, "center", "center", "middle", 1, "^:"..Main[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Main[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        elseif cycle == 10 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Main[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Main[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Main[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Main[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Main[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Main[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Main[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Main[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Main[9], 1);
            local option10 = create_TextElement(2, "big", 0, 40, 0, "center", "center", "middle", 1, "^:"..Main[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        end
    elseif menu == "submenu1" then
        if cycle == 1 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(2, "big", 0, -140, 0, "center", "center", "middle", 1, "^:"..Submenu1[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Submenu1[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Submenu1[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Submenu1[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Submenu1[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Submenu1[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Submenu1[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Submenu1[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Submenu1[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Submenu1[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        elseif cycle == 2 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Submenu1[1], 1);
            local option2 = create_TextElement(2, "big", 0, -120, 0, "center", "center", "middle", 1, "^:"..Submenu1[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Submenu1[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Submenu1[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Submenu1[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Submenu1[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Submenu1[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Submenu1[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Submenu1[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Submenu1[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        elseif cycle == 3 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Submenu1[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Submenu1[2], 1);
            local option3 = create_TextElement(2, "big", 0, -100, 0, "center", "center", "middle", 1, "^:"..Submenu1[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Submenu1[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Submenu1[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Submenu1[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Submenu1[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Submenu1[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Submenu1[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Submenu1[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        elseif cycle == 4 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Submenu1[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Submenu1[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Submenu1[3], 1);
            local option4 = create_TextElement(2, "big", 0, -80, 0, "center", "center", "middle", 1, "^:"..Submenu1[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Submenu1[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Submenu1[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Submenu1[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Submenu1[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Submenu1[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Submenu1[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        elseif cycle == 5 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Submenu1[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Submenu1[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Submenu1[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Submenu1[4], 1);
            local option5 = create_TextElement(2, "big", 0, -60, 0, "center", "center", "middle", 1, "^:"..Submenu1[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Submenu1[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Submenu1[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Submenu1[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Submenu1[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Submenu1[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        elseif cycle == 6 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Submenu1[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Submenu1[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Submenu1[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Submenu1[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Submenu1[5], 1);
            local option6 = create_TextElement(2, "big", 0, -40, 0, "center", "center", "middle", 1, "^:"..Submenu1[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Submenu1[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Submenu1[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Submenu1[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Submenu1[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        elseif cycle == 7 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Submenu1[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Submenu1[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Submenu1[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Submenu1[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Submenu1[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Submenu1[6], 1);
            local option7 = create_TextElement(2, "big", 0, -20, 0, "center", "center", "middle", 1, "^:"..Submenu1[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Submenu1[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Submenu1[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Submenu1[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        elseif cycle == 8 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Submenu1[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Submenu1[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Submenu1[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Submenu1[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Submenu1[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Submenu1[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Submenu1[7], 1);
            local option8 = create_TextElement(2, "big", 0, 0, 0, "center", "center", "middle", 1, "^:"..Submenu1[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Submenu1[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Submenu1[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        elseif cycle == 9 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Submenu1[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Submenu1[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Submenu1[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Submenu1[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Submenu1[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Submenu1[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Submenu1[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Submenu1[8], 1);
            local option9 = create_TextElement(2, "big", 0, 20, 0, "center", "center", "middle", 1, "^:"..Submenu1[9], 1);
            local option10 = create_TextElement(1.5, "big", 0, 40, 0, "center", "center", "middle", 1, Submenu1[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        elseif cycle == 10 then

            local title = create_TextElement(1.5, "big", 0, -180, 0, "center", "center", "middle", 1, "^:Menu Base", 1);
            local credits = create_TextElement(0.8, "big", 0, -165, 0, "center", "center", "middle", 1, "by Lurkzy", 1);
            local option1 = create_TextElement(1.5, "big", 0, -140, 0, "center", "center", "middle", 1, Submenu1[1], 1);
            local option2 = create_TextElement(1.5, "big", 0, -120, 0, "center", "center", "middle", 1, Submenu1[2], 1);
            local option3 = create_TextElement(1.5, "big", 0, -100, 0, "center", "center", "middle", 1, Submenu1[3], 1);
            local option4 = create_TextElement(1.5, "big", 0, -80, 0, "center", "center", "middle", 1, Submenu1[4], 1);
            local option5 = create_TextElement(1.5, "big", 0, -60, 0, "center", "center", "middle", 1, Submenu1[5], 1);
            local option6 = create_TextElement(1.5, "big", 0, -40, 0, "center", "center", "middle", 1, Submenu1[6], 1);
            local option7 = create_TextElement(1.5, "big", 0, -20, 0, "center", "center", "middle", 1, Submenu1[7], 1);
            local option8 = create_TextElement(1.5, "big", 0, 0, 0, "center", "center", "middle", 1, Submenu1[8], 1);
            local option9 = create_TextElement(1.5, "big", 0, 20, 0, "center", "center", "middle", 1, Submenu1[9], 1);
            local option10 = create_TextElement(2, "big", 0, 40, 0, "center", "center", "middle", 1, "^:"..Submenu1[10], 1);
            player:onnotifyonce("changeMenu", function() changeMenu(option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, title, credits) end)

        end
    end
end

function changeMenu(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15)

    arg1:destroy();
    if arg2 then arg2:destroy(); end 
    if arg3 then arg3:destroy(); end
    if arg4 then arg4:destroy(); end
    if arg5 then arg5:destroy(); end
    if arg6 then arg6:destroy(); end
    if arg7 then arg7:destroy(); end
    if arg8 then arg8:destroy(); end
    if arg9 then arg9:destroy(); end
    if arg10 then arg10:destroy(); end
    if arg11 then arg11:destroy(); end
    if arg12 then arg12:destroy(); end
    if arg13 then arg13:destroy(); end
    if arg14 then arg14:destroy(); end
    if arg15 then arg15:destroy(); end

end

function create_TextElement(fontscale, font, x, y, z, alignx, horzalign, vertalign, alpha, label, glowalpha)

    local textElem = game:newhudelem();
    textElem.fontscale = fontscale;
    textElem.font = font;
    textElem.x = x;
    textElem.y = y;
    textElem.z = z;
    textElem.alignx = alignx;
    textElem.horzalign = horzalign;
    textElem.vertalign = vertalign;
    textElem.alpha = alpha;
    textElem:settext(label);
    textElem.sort = 1;
    textElem.foreground = true;
    textElem.glowalpha = glowalpha;

    return textElem;

end

include ("__functions")
include ("__base")

local Main = { "Main Mods", "Submenu 2", "Submenu 3", "Submenu 4", "Submenu 5", "Submenu 6", "Submenu 7", "Submenu 8", "Submenu 9", "Submenu 10" }
local Submenu1 = { "God Mode", "Noclip", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8", "Option 9", "Option 10" }

function createHud(player, menu)

    if menu == "main" then

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

    elseif menu == "submenu1" then

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
    end
end

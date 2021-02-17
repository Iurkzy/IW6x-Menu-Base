
local godmodeBool = false;

function godmode(player)

    if godmodeBool == false then

        godmodeBool = true;
        game:executecommand("god")

    else

        godmodeBool = false;
        game:executecommand("god")

    end

end

local noclipBool = false;

function noclip(player)

    if noclipBool == false then

        noclipBool = true;
        game:executecommand("noclip")

    else

        noclipBool = false;
        game:executecommand("noclip")

    end
    
end
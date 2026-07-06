-- =============================================================================
-- SYSTEM TOOLS MODULE
-- =============================================================================
local Tools = {}

-- This function clears the terminal screen depending on the OS
function Tools.EffacerEcran()
    -- os.getenv("OS") returns "Windows_NT" on Windows machines
    if os.getenv("OS") == "Windows_NT" then
        os.execute("cls") -- "cls" is the Windows command to clear screen
    else
        os.execute("clear") -- "clear" is the Linux/Mac command to clear screen
    end
end

-- We return our tools table so main.lua can use it
return Tools
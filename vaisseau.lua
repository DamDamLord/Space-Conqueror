-- =============================================================================
-- 1. BASE BASE CHARACTERISTICS (TEMPLATES / BLUEPRINTS)
-- =============================================================================

-- Base stats for the player ship
local playerTemplate = {
    pointVie = 100,
    x = 5,
    y = 0,
    sprite = "{+}"
}

-- Base stats for the alien enemies
local enemyTemplate = {
    pointVie = 5,
    x = 5,
    y = 0,
    sprite = "{-}"
}

-- Base stats for the lasers
local laserTemplate = {
    x = 0,
    y = 0,
    sprite = "|"
}

-- =============================================================================
-- 2. OBJECT METHODS (FUNCTIONS THAT ACTIONS PERFORM)
-- =============================================================================

-- Enemy movement functions
function enemyTemplate:deplacerDroite()
    self.x = self.x + 1
end

function enemyTemplate:deplacerGauche()
    self.x = self.x - 1
end

-- =============================================================================
-- 3. FACTORIES (THE MOLDS TO CREATE NEW INDEPENDENT COPIES)
-- =============================================================================

-- --- PLAYER MOULD ---
local PlayerMould = {}

function PlayerMould.creer()
    local newPlayer = {} -- Create a fresh, empty object
    
    -- Connect this new object to the base characteristics
    local playerClass = { __index = playerTemplate }
    setmetatable(newPlayer, playerClass)
    
    return newPlayer
end

-- --- ENEMY MOULD ---
local EnemyMould = {}

function EnemyMould.creer()
    local newEnemy = {} -- Create a fresh, empty object
    
    -- Connect this new object to the base characteristics
    local enemyClass = { __index = enemyTemplate }
    setmetatable(newEnemy, enemyClass)
    
    return newEnemy
end

-- --- LASER MOULD ---
local LaserMould = {}

-- This factory requires x and y parameters to know where the laser starts!
function LaserMould.creer(startX, startY)
    local newLaser = {} -- 1. First, we create the fresh empty object
    
    -- 2. Then, we immediately apply the starting coordinates passed as arguments
    newLaser.x = startX
    newLaser.y = startY
    
    -- 3. Finally, we connect it to the base characteristics
    local laserClass = { __index = laserTemplate }
    setmetatable(newLaser, laserClass)
    
    return newLaser
end

-- =============================================================================
-- 4. EXPORTING THE MODULE
-- =============================================================================
-- We wrap our 3 factories inside a single table using easy-to-read English keys
local GameFactories = {
    Vaisseau = PlayerMould,
    Enemie = EnemyMould,
    Laser = LaserMould
}

-- We return this table so main.lua can use it via 'require'
return GameFactories
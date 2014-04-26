-- GMO Game
-- by amtra5

-- Use this function to perform your initial setup
function setup()
    savefile = readLocalData("savefile", {unlockedrows=1,money=100,blue=3,green=3,yellow=3,fertilizer=3,growingplants={}})
    
    function drawachievementbox(drawx, drawy, drawheight, drawwidth)
        spriteMode(CORNER)
        sprite(minecraft_achievment_center, drawx+(drawheight/8), drawy, drawwidth-2*(drawheight/8), drawheight)
        sprite(minecraft_achievement_left, drawx, drawy, 4*(drawheight/32), drawheight)
        sprite(minecraft_achievement_right, drawx+(drawwidth-(drawheight/8)), drawy, drawheight/8, drawheight)
    end
    function resettextures()
        minecraft_achievment_center = "Dropbox:minecraft_achievment_center"
        minecraft_achievement_left = "Dropbox:minecraft_achievement_left"
        minecraft_achievement_right = "Dropbox:minecraft_achievement_right"
        minecraft_bonemeal = "Dropbox:minecraft_bonemeal"
        minecraft_tilledsoil = "Dropbox:minecraft_tilledsoil"
        minecraft_tilledwetsoil = "Dropbox:minecraft_tilledwetsoil"
        minecraft_gold = "Dropbox:minecraft_gold"
        railcraft_frostbrick = "Dropbox:railcraft_frostbrick"
        special_bluepotion = "Dropbox:bluepotion"
        special_greenpotion = "Dropbox:greenpotion"
        special_yellowpotion = "Dropbox:yellowpotion"
        special_plus = "Dropbox:plus"
        tinkersconstruct_advanceddrawbridge = "Dropbox:tinkersconstruct_advanceddrawbridge"
        tinkersconstruct_blankcast = "Dropbox:tinkersconstruct_blankcast"
    end
    function sphax_set()
        minecraft_bonemeal = "Dropbox:sphax_minecraft_bonemeal"
        minecraft_tilledsoil = "Dropbox:sphax_minecraft_tilledsoil"
        minecraft_tilledwetsoil = "Dropbox:sphax_minecraft_tilledwetsoil"
        minecraft_gold = "Dropbox:sphax_minecraft_gold"
        railcraft_frostbrick = "Dropbox:sphax_railcraft_frostbrick"
        special_bluepotion = "Dropbox:sphax_bluepotion"
        special_greenpotion = "Dropbox:sphax_greenpotion"
        special_yellowpotion = "Dropbox:sphax_yellowpotion"
        tinkersconstruct_advanceddrawbridge = "Dropbox:sphax_tinkersconstruct_advanceddrawbridge"
        tinkersconstruct_blankcast = "Dropbox:sphax_tinkersconstruct_blankcast"
    end
    
    resettextures()
    
    parameter.action("Default", resettextures)
    parameter.action("Sphax", sphax_set)
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    --background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(5)

    -- Do your drawing here
    
    --background
    spriteMode(CENTER)
    for x=32, 1024-32, 64 do
        for y=32, 768-32, 64 do
            sprite(railcraft_frostbrick, x, y, 64)
        end
    end
    
    sprite(tinkersconstruct_advanceddrawbridge, 1024-64, 64, 128)
    
    --draw money/fertiliser/gmo stats
    drawachievementbox(224, 768-16-64, 64, 256)
    drawachievementbox(544, 768-16-64, 64, 256)
    drawachievementbox(176, 16, 64, 192)
    drawachievementbox(416, 16, 64, 192)
    drawachievementbox(656, 16, 64, 192)
    spriteMode(CORNER)
    sprite(minecraft_gold, 224+8, 768-16-64, 64, 64)
    sprite(minecraft_bonemeal, 544+8, 768-16-64, 64, 64)
    sprite(special_bluepotion, 176+8, 16, 64, 64)
    sprite(special_greenpotion, 416+8, 16, 64, 64)
    sprite(special_yellowpotion, 656+8, 16, 64, 64)
    textMode(CORNER)
    fill(255, 255, 255, 255)
    fontSize(30)
    text(savefile.money, 224+64+8, 768-64)
    text(savefile.fertilizer, 544+64+8, 768-64)
    text(savefile.blue, 176+64+8, 32)
    text(savefile.green, 416+64+8, 32)
    text(savefile.yellow, 656+64+8, 32)
    
    --draw main box
    spriteMode(CORNER)
    for x=128, 1024-256, 128 do
        for y=768-256, 768-128-(savefile.unlockedrows*128), -128 do
            sprite(minecraft_tilledsoil, x, y, 128, 128)
        end
    end
    rectMode(CORNER)
    noStroke()
    fill(93, 84, 84, 255)
    --rect(128, 128, 1024-256, 128*(4-savefile.unlockedrows))
    for x=128, 1024-256, 128 do
        for y=128, (4-savefile.unlockedrows)*128, 128 do
            sprite(tinkersconstruct_blankcast, x, y, 128, 128)
            sprite(special_plus, x, y, 128, 128)
        end
    end
    stroke(255, 255, 255, 255)
    strokeWidth(5)
    noFill()
    rect(128, 128, 1024-256, 768-256)
    line(128, 128*(5-savefile.unlockedrows), 1024-128, 128*(5-savefile.unlockedrows))
end


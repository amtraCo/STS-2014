-- GMO Game
-- by amtra5

displayMode(OVERLAY)
supportedOrientations(LANDSCAPE_ANY)

-- Use this function to perform your initial setup
function setup()
    savefile = readLocalData("savefile", {money=100,blue=3,green=3,yellow=3,fertilizer=3,carrots=0,potatos=0,wheat=0,slots={{x=128,y=128,tiletype="locked",tiledata={}},{x=256,y=128,tiletype="locked",tiledata={}},{x=384,y=128,tiletype="locked",tiledata={}},{x=512,y=128,tiletype="locked",tiledata={}},{x=640,y=128,tiletype="locked",tiledata={}},{x=768,y=128,tiletype="locked",tiledata={}},{x=128,y=256,tiletype="locked",tiledata={}},{x=256,y=256,tiletype="locked",tiledata={}},{x=384,y=256,tiletype="locked",tiledata={}},{x=512,y=256,tiletype="locked",tiledata={}},{x=640,y=256,tiletype="locked",tiledata={}},{x=768,y=256,tiletype="locked",tiledata={}},{x=128,y=384,tiletype="locked",tiledata={}},{x=256,y=384,tiletype="locked",tiledata={}},{x=384,y=384,tiletype="locked",tiledata={}},{x=512,y=384,tiletype="locked",tiledata={}},{x=640,y=384,tiletype="locked",tiledata={}},{x=768,y=384,tiletype="locked",tiledata={}},{x=128,y=512,tiletype="blank",tiledata={}},{x=256,y=512,tiletype="blank",tiledata={}},{x=384,y=512,tiletype="blank",tiledata={}},{x=512,y=512,tiletype="locked",tiledata={}},{x=640,y=512,tiletype="locked",tiledata={}},{x=768,y=512,tiletype="locked",tiledata={}}}})
    
    currentscreen = "main"
    parameter.watch("currentscreen")
    lasttouchx = 0
    lasttouchy = 0
    
    function resettextures()
        hqm_questbook = "Dropbox:hqm_questbook"
        minecraft_achievment_center = "Dropbox:minecraft_achievment_center"
        minecraft_achievement_left = "Dropbox:minecraft_achievement_left"
        minecraft_achievement_right = "Dropbox:minecraft_achievement_right"
        minecraft_bonemeal = "Dropbox:minecraft_bonemeal"
        minecraft_bookpage = "Dropbox:minecraft_bookpage"
        minecraft_carrot = "Dropbox:minecraft_carrot"
        minecraft_tilledsoil = "Dropbox:minecraft_tilledsoil"
        minecraft_tilledwetsoil = "Dropbox:minecraft_tilledwetsoil"
        minecraft_gold = "Dropbox:minecraft_gold"
        minecraft_potato = "Dropbox:minecraft_potato"
        minecraft_wheat = "Dropbox:minecraft_wheat"
        railcraft_frostbrick = "Dropbox:railcraft_frostbrick"
        railcraft_steelblock = "Dropbox:railcraft_steelblock"
        special_bluepotion = "Dropbox:special_bluepotion"
        special_greenpotion = "Dropbox:special_greenpotion"
        special_yellowpotion = "Dropbox:special_yellowpotion"
        tinkersconstruct_advanceddrawbridge = "Dropbox:tinkersconstruct_advanceddrawbridge"
    end
    function sphax_set()
        hqm_questbook = "Dropbox:sphax_hqm_questbook"
        minecraft_bonemeal = "Dropbox:sphax_minecraft_bonemeal"
        minecraft_bookpage = "Dropbox:sphax_minecraft_bookpage"
        minecraft_carrot = "Dropbox:sphax_minecraft_carrot"
        minecraft_tilledsoil = "Dropbox:sphax_minecraft_tilledsoil"
        minecraft_tilledwetsoil = "Dropbox:sphax_minecraft_tilledwetsoil"
        minecraft_gold = "Dropbox:sphax_minecraft_gold"
        minecraft_potato = "Dropbox:sphax_minecraft_potato"
        minecraft_wheat = "Dropbox:sphax_minecraft_wheat"
        railcraft_frostbrick = "Dropbox:sphax_railcraft_frostbrick"
        railcraft_steelblock = "Dropbox:sphax_railcraft_steelblock"
        special_bluepotion = "Dropbox:sphax_special_bluepotion"
        special_greenpotion = "Dropbox:sphax_special_greenpotion"
        special_yellowpotion = "Dropbox:sphax_special_yellowpotion"
        tinkersconstruct_advanceddrawbridge = "Dropbox:sphax_tinkersconstruct_advanceddrawbridge"
    end
    function drawachievementbox(drawx, drawy, drawheight, drawwidth)
        spriteMode(CORNER)
        sprite(minecraft_achievment_center, drawx+(drawheight/8), drawy, drawwidth-2*(drawheight/8), drawheight)
        sprite(minecraft_achievement_left, drawx, drawy, 4*(drawheight/32), drawheight)
        sprite(minecraft_achievement_right, drawx+(drawwidth-(drawheight/8)), drawy, drawheight/8, drawheight)
    end
    function drawmain()
        --draw main box
        for plot = 1, #savefile.slots do
            local plotdata = savefile.slots[plot]
            local plotx = plotdata.x
            local ploty = plotdata.y
            if plotdata.tiletype == "blank" then
                sprite(minecraft_tilledsoil, plotx, ploty, 128, 128)
            elseif plotdata.tiletype == "locked" then
                sprite(railcraft_steelblock, plotx, ploty, 128, 128)
                strokeWidth(5)
                line(plotx+64, ploty+32, plotx+64, ploty+32+64)
                line(plotx+32, ploty+64, plotx+32+64, ploty+64)
            end
        end
        
        rectMode(CORNER)
        stroke(255, 255, 255, 255)
        noFill()
        strokeWidth(5)
        rect(128, 128, 1024-256, 768-256)
    end
    function drawviewquests()
        
    end
    function drawshop()
        
    end
    function drawgmoinfo()
        sprite(minecraft_bookpage, 293, 114, 438, 540)
        textMode(CENTER)
        textAlign(CENTER)
        textWrapWidth(350)
        fill(0, 0, 0, 255)
        text("Touch anywhere to continue", 512, 170)
        text("Transgenic plants have been engineered for scientific research, to create new colours in plants, and to create different crops. In agriculture, currently marketed genetically engineered crops have traits such as resistance to pests, resistance to herbicides, increased nutritional value, or production of valuable goods such as drugs (pharming). A genetically modified organism (GMO) is an organism whose genetic material has been altered using genetic engineering techniques. Organisms that have been genetically modified include micro-organisms such as bacteria and yeast, insects, plants, fish, and mammals. GMOs are the source of genetically modified foods, and are also widely used in scientific research and to produce goods other than food", 512, 384)
    end
    function drawcarrotinfo()
        sprite(minecraft_bookpage, 293, 114, 438, 540)
        textMode(CENTER)
        fill(0, 0, 0, 255)
        text("Touch anywhere to continue", 512, 160)
    end
    function drawpotatoinfo()
        sprite(minecraft_bookpage, 293, 114, 438, 540)
        textMode(CENTER)
        fill(0, 0, 0, 255)
        text("Touch anywhere to continue", 512, 160)
    end
    function drawwheatinfo()
        sprite(minecraft_bookpage, 293, 114, 438, 540)
        textMode(CENTER)
        fill(0, 0, 0, 255)
        text("Touch anywhere to continue", 512, 160)
    end
    function touch(tx, ty)
        lasttouchx = tx
        lasttouchy = ty
        print("touch: "..tx..", "..ty)
        if currentscreen == "main" and tx >= 0 and tx <= 128 and ty >= 0 and ty <= 128 then 
            currentscreen = "viewquests" 
        elseif currentscreen == "main" and tx >= 896 and tx <= 1024 and ty >= 0 and ty <= 128 then
            currentscreen = "shop"
        elseif currentscreen == "main" and ((tx >= 208 and tx <= 368) or (tx >= 432 and tx <= 592) or (tx >= 656 and tx <= 816)) and ty >= 16 and ty <= 80 then
            currentscreen = "gmoinfo"
        elseif currentscreen == "main" and tx >= 256 and tx <= 384 and ty >= 688 and ty <= 752 then
            currentscreen = "carrotinfo"
        elseif currentscreen == "main" and tx >= 448 and tx <= 576 and ty >= 688 and ty <= 752 then
            currentscreen = "potatoinfo"
        elseif currentscreen == "main" and tx >= 640 and tx <= 704 and ty >= 688 and ty <= 752 then
            currentscreen = "wheatinfo"
        elseif currentscreen == "gmoinfo" or currentscreen == "carrotinfo" or currentscreen == "potatoinfo" or currentscreen == "wheatinfo" then
            currentscreen = "main"
        end
    end
    
    resettextures()
    
    parameter.action("Reset Display", function() currentscreen = "main" end)
    parameter.action("Default", resettextures)
    parameter.action("Sphax", sphax_set)
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    --background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(5)
    
    if CurrentTouch.state == BEGAN and (CurrentTouch.x ~= lasttouchx or CurrentTouch.y ~= lasttouchy) and CurrentTouch.x ~= 0 and CurrentTouch.y ~= 0 and CurrentTouch.x >= 0 and CurrentTouch.x <= 1024 and CurrentTouch.y >= 0 and CurrentTouch.y <= 768 then touch(CurrentTouch.x, CurrentTouch.y) end

    -- Do your drawing here
    
    --background
    spriteMode(CENTER)
    for x=32, 1024-32, 64 do
        for y=32, 768-32, 64 do
            sprite(railcraft_frostbrick, x, y, 64)
        end
    end
    
    sprite(tinkersconstruct_advanceddrawbridge, 1024-64, 64, 128, 128)
    sprite(hqm_questbook, 64, 64, 128, 128)
    
    --draw money/fertiliser/gmo stats
    drawachievementbox(64, 768-16-64, 64, 128)
    drawachievementbox(256, 768-16-64, 64, 128)
    drawachievementbox(448, 768-16-64, 64, 128)
    drawachievementbox(640, 768-16-64, 64, 128)
    drawachievementbox(832, 768-16-64, 64, 128)
    drawachievementbox(208, 16, 64, 160)
    drawachievementbox(432, 16, 64, 160)
    drawachievementbox(656, 16, 64, 160)
    spriteMode(CORNER)
    sprite(minecraft_gold, 64+8, 768-16-64, 64, 64)
    sprite(minecraft_carrot, 256, 768-16-64, 64, 64)
    sprite(minecraft_potato, 448, 768-16-64, 64, 64)
    sprite(minecraft_wheat, 640, 768-16-64, 64, 64)
    sprite(minecraft_bonemeal, 832+8, 768-16-64, 64, 64)
    sprite(special_bluepotion, 208+8, 16, 64, 64)
    sprite(special_greenpotion, 432+8, 16, 64, 64)
    sprite(special_yellowpotion, 656+8, 16, 64, 64)
    textMode(CORNER)
    textAlign(LEFT)
    fill(255, 255, 255, 255)
    fontSize(15)
    font("AmericanTypewriter")
    text(savefile.money, 64+64+8, 768-58)
    text(savefile.carrots, 256+64+8, 768-58)
    text(savefile.potatos, 448+64+8, 768-58)
    text(savefile.wheat, 640+64+8, 768-58)
    text(savefile.fertilizer, 832+64+8, 768-58)
    text(savefile.blue, 208+64+8, 38)
    text(savefile.green, 432+64+8, 38)
    text(savefile.yellow, 656+64+8, 38)
    
    if currentscreen == "main" then drawmain() 
    elseif currentscreen == "viewquests" then drawviewquests()
    elseif currentscreen == "shop" then drawshop()
    elseif currentscreen == "gmoinfo" then drawgmoinfo()
    elseif currentscreen == "carrotinfo" then drawcarrotinfo()
    elseif currentscreen == "potatoinfo" then drawpotatoinfo()
    elseif currentscreen == "wheatinfo" then drawwheatinfo()
    end
end
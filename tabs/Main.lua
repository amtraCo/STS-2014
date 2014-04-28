-- GMO Game
-- by amtra5

displayMode(OVERLAY)
supportedOrientations(LANDSCAPE_ANY)

-- Use this function to perform your initial setup
function setup()
    savefile = readLocalData("savefile", {currentblankavaliable=3,money=100,blue=3,green=3,yellow=3,fertilizer=3,carrots=0,potatos=0,wheat=0,quests={{questno=1,questname="Welcome",description="Welcome to GMO Game",done=false,questdata={}}},slots={{x=128,y=128,tiletype="locked",tiledata={}},{x=256,y=128,tiletype="locked",tiledata={}},{x=384,y=128,tiletype="locked",tiledata={}},{x=512,y=128,tiletype="locked",tiledata={}},{x=640,y=128,tiletype="locked",tiledata={}},{x=768,y=128,tiletype="locked",tiledata={}},{x=128,y=256,tiletype="locked",tiledata={}},{x=256,y=256,tiletype="locked",tiledata={}},{x=384,y=256,tiletype="locked",tiledata={}},{x=512,y=256,tiletype="locked",tiledata={}},{x=640,y=256,tiletype="locked",tiledata={}},{x=768,y=256,tiletype="locked",tiledata={}},{x=128,y=384,tiletype="locked",tiledata={}},{x=256,y=384,tiletype="locked",tiledata={}},{x=384,y=384,tiletype="locked",tiledata={}},{x=512,y=384,tiletype="locked",tiledata={}},{x=640,y=384,tiletype="locked",tiledata={}},{x=768,y=384,tiletype="locked",tiledata={}},{x=128,y=512,tiletype="blank",tiledata={}},{x=256,y=512,tiletype="blank",tiledata={}},{x=384,y=512,tiletype="blank",tiledata={}},{x=512,y=512,tiletype="locked",tiledata={}},{x=640,y=512,tiletype="locked",tiledata={}},{x=768,y=512,tiletype="locked",tiledata={}}}})
    
    currentscreen = "splash"
    buystate = 1
    parameter.watch("currentscreen")
    lasttouchx = 0
    lasttouchy = 0
    splashtimeout = 5
    
    function resettextures()
        hqm_questbook = "Dropbox:hqm_questbook"
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
        special_achievement_center = "Dropbox:special_achievement_center"
        special_achievement_left = "Dropbox:special_achievement_left"
        special_achievement_right = "Dropbox:special_achievement_right"
        special_achievement_centergreen = "Dropbox:special_achievement_centergreen"
        special_achievement_leftgreen = "Dropbox:special_achievement_leftgreen"
        special_achievement_rightgreen = "Dropbox:special_achievement_rightgreen"
        special_bluepotion = "Dropbox:special_bluepotion"
        special_greenpotion = "Dropbox:special_greenpotion"
        special_greenshade = "Dropbox:special_greenshade"
        special_questlist = "Dropbox:special_questlist"
        special_redshade = "Dropbox:special_redshade"
        special_shop = "Dropbox:special_shop"
        special_yellowpotion = "Dropbox:special_yellowpotion"
        tinkersconstruct_advanceddrawbridge = "Dropbox:tinkersconstruct_advanceddrawbridge"
        thermalexpansion_debugger = "Dropbox:thermalexpansion_debugger"
    end
    function sphax_set()
        cofh_block = "Dropbox:cofh_block"
        cofh_cross = "Dropbox:cofh_cross"
        cofh_info = "Dropbox:cofh_info"
        cofh_tick = "Dropbox:cofh_tick"
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
        thermalexpansion_debugger = "Dropbox:sphax_thermalexpansion_debugger"
    end
    function drawachievementbox(drawx, drawy, drawheight, drawwidth)
        spriteMode(CORNER)
        sprite(special_achievement_center, drawx+(drawheight/8), drawy, drawwidth-2*(drawheight/8), drawheight)
        sprite(special_achievement_left, drawx, drawy, 4*(drawheight/32), drawheight)
        sprite(special_achievement_right, drawx+(drawwidth-(drawheight/8)), drawy, drawheight/8, drawheight)
    end
    function drawachievementboxgreen(drawx, drawy, drawheight, drawwidth)
        spriteMode(CORNER)
        sprite(special_achievement_centergreen, drawx+(drawheight/8), drawy, drawwidth-2*(drawheight/8), drawheight)
        sprite(special_achievement_leftgreen, drawx, drawy, 4*(drawheight/32), drawheight)
        sprite(special_achievement_rightgreen, drawx+(drawwidth-(drawheight/8)), drawy, drawheight/8, drawheight)
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
            elseif plotdata.tiletype == "growingcarrot" then
                sprite(minecraft_tilledwetsoil, plotx, ploty, 128, 128)
                sprite(minecraft_carrot, plotx+32, ploty+32, 64, 64)
            end
        end
        
        rectMode(CORNER)
        stroke(255, 255, 255, 255)
        noFill()
        strokeWidth(5)
        rect(128, 128, 1024-256, 768-256)
    end
    function drawviewquests()
        sprite(special_questlist, 236, 198)
        if #savefile.quests >= 1 then
            drawachievementbox(263, 430, 105, 400)
        end
        if #savefile.quests >= 2 then
            drawachievementbox(263, 324, 105, 400)
        end
        if #savefile.quests >= 3 then
            drawachievementbox(263, 218, 105, 400)
        end
    end
    function drawshop()
        sprite(special_shop, 320, 217)
        sprite(minecraft_gold, 352, 413, 64, 64)
        text(currentshopdeal.amount, 384, 413)
        sprite(currentshopdeal.art, 434, 280, 192, 192)
        textMode(CENTER)
        if buystate == 1 then
            text(currentshopdeal.name, 528, 250)
        end
        if buystate == 2 then
            sprite(cofh_block, 354, 341, 64, 64)
            sprite(cofh_tick, 340, 217, 64, 64)
            sprite(cofh_cross, 620, 217, 64, 64)
            text("Are you sure?", 528, 250)
        end
    end
    function drawbibliography()
        sprite(minecraft_bookpage, 293, 114, 438, 540)
        textMode(CENTER)
        textAlign(CENTER)
        textWrapWidth(350)
        fill(0, 0, 0, 255)
        text("Touch anywhere to continue", 512, 170)
        text("GMO Game", 512, 620)
        text("Code - Angus Trau", 512, 550)
        text("Research - Allan Chan, Mark Soo", 512, 535)
        text("Textures:", 512, 505)
        text("Created by the PureBDCraft Community", 512, 490)
        text("Customized by Angus Trau", 512, 475)
        text("Sources:", 512, 445)
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
        textAlign(CENTER)
        textWrapWidth(350)
        fill(0, 0, 0, 255)
        text("Touch anywhere to continue", 512, 170)
    end
    function drawpotatoinfo()
        sprite(minecraft_bookpage, 293, 114, 438, 540)
        textMode(CENTER)
        textAlign(CENTER)
        textWrapWidth(350)
        fill(0, 0, 0, 255)
        text("Touch anywhere to continue", 512, 170)
    end
    function drawwheatinfo()
        sprite(minecraft_bookpage, 293, 114, 438, 540)
        textMode(CENTER)
        textAlign(CENTER)
        textWrapWidth(350)
        fill(0, 0, 0, 255)
        text("Touch anywhere to continue", 512, 170)
    end
    function touch(tx, ty)
        lasttouchx = tx
        lasttouchy = ty
        print("touch: "..tx..", "..ty)
        if currentscreen == "main" and tx >= 0 and tx <= 128 and ty >= 0 and ty <= 128 then 
            print("button: viewquests")
            currentscreen = "viewquests" 
        elseif currentscreen == "main" and tx >= 896 and tx <= 1024 and ty >= 0 and ty <= 128 then
            print("button: shop")
            currentscreen = "shop"
        elseif currentscreen == "main" and tx >= 896 and ty <= 1024 and ty >= 128 and ty <= 256 then
            print("button: bibliography")
            currentscreen = "bibliography"
        elseif currentscreen == "main" and ((tx >= 208 and tx <= 368) or (tx >= 432 and tx <= 592) or (tx >= 656 and tx <= 816)) and ty >= 16 and ty <= 80 then
            print("button: gmoinfo")
            currentscreen = "gmoinfo"
        elseif currentscreen == "main" and tx >= 256 and tx <= 384 and ty >= 688 and ty <= 752 then
            print("button: carrotinfo")
            currentscreen = "carrotinfo"
        elseif currentscreen == "main" and tx >= 448 and tx <= 576 and ty >= 688 and ty <= 752 then
            print("button: potatoinfo")
            currentscreen = "potatoinfo"
        elseif currentscreen == "main" and tx >= 640 and tx <= 704 and ty >= 688 and ty <= 752 then
            print("button: wheatinfo")
            currentscreen = "wheatinfo"
        elseif currentscreen == "bibliography" or currentscreen == "gmoinfo" or currentscreen == "carrotinfo" or currentscreen == "potatoinfo" or currentscreen == "wheatinfo" then
            print("button: exittomain")
            currentscreen = "main"
        elseif currentscreen == "viewquests" then
            touchviewquests(tx, ty)
        elseif currentscreen == "shop" then
            touchshop(tx, ty)
        end
    end
    function touchviewquests(tx, ty)
        if tx >= 729 and tx <= 761 and ty >= 516 and ty <= 546 then
            print("button: exittomain")
            currentscreen = "main"
        end
    end
    function touchshop(tx, ty)
        if tx >= 637 and tx <= 677 and ty >= 488 and ty <= 524 then
            print("button: exittomain")
            currentscreen = "main"
            buystate = 1
        elseif tx >= 365 and tx <= 409 and ty >= 491 and ty <= 523 then
            print("button: shopscrollup")
            if shopcurrentselected == #shopdeals then
                shopcurrentselected = 1
                currentshopdeal = shopdeals[1]
            else
                shopcurrentselected = shopcurrentselected + 1
                currentshopdeal = shopdeals[shopcurrentselected]
            end
            buystate = 1
        elseif tx >= 365 and tx <= 409 and ty >= 304 and ty <= 334 then
            print("button:shopscrolldown")
            if shopcurrentselected == 1 then
                shopcurrentselected = #shopdeals
                currentshopdeal = shopdeals[#shopdeals]
            else
                shopcurrentselected = shopcurrentselected - 1
                currentshopdeal = shopdeals[shopcurrentselected]
            end
            buystate = 1
        elseif tx >= 354 and tx <= 416 and ty >= 341 and ty <= 413 then
            print("button: confirmbuy")
            buystate = 2
        elseif tx >= 340 and tx <= 404 and ty >= 217 and ty <= 261 and buystate == 2 then
            buystate = 1
            currentshopdeal.callback()
        elseif tx >= 620 and tx <= 684 and ty >= 217 and ty <= 261 and buystate == 2 then
            print("button: cancelbuy")
            buystate = 1
        end
    end
    function plant(product, productdata)
        print("button: buy "..product)
        if product == "500carrot" then
            if savefile.money >= productdata.amount and savefile.currentblankavaliable > 0 then
                savefile.money = savefile.money - productdata.amount
                alert("Successfuly bought 500 carrots!", "Store")
                for plot = 1, 24 do
                    if savefile.slots[plot].tiletype == "blank" then
                        setplot = savefile.slots[plot]
                        setplot.tiletype = "growingcarrot"
                        setplot.tiledata = {growthstart=os.date("!*t"),plantdata=productdata}
                        savefile.currentblankavaliable = savefile.currentblankavaliable - 1 
                        currentscreen = "main"
                        return
                    end
                end
            else
                if savefile.money < productdata.amount then
                    alert("You don't have enough gold!", "Shop")
                else
                    alert("You don't have any more free slots!", "Shop")
                end
            end
        end
    end
    
    resettextures()
    sphax_set()
    shopcurrentselected = 1
    shopdeals = {{amount=5,callback=function() plant("500carrot", shopdeals[1]) end,art=minecraft_carrot,name="500 Carrots"},{amount=10, callback=function() plant("500potato", shopdeals[2]) end,art=minecraft_potato,name="500 Potatos"},{amount=15,callback=function() plant("500wheat", shopdeals[3]) end,art=minecraft_wheat,name="500 Wheat"},{amount=30,callback=function() if savefile.money > 30 then savefile.money = savefile.money - 30 savefile.fertilizer = savefile.fertilizer + 1 alert("Successfuly bought 1 fertilizer!", "Shop") else alert("You don't have enough gold!", "Shop") end end,art=minecraft_bonemeal,name="1 Fertilizer"},{amount=50,callback=function() if savefile.money > 50 then savefile.money = savefile.money - 50 savefile.blue = savefile.blue + 1 alert("Successfuly bought 1 Blue GMO!", "Shop") else alert("You don't have enough gold!", "Shop") end end,art=special_bluepotion,name="1 Blue GMO"},{amount=50,callback=function() if savefile.money > 50 then savefile.money = savefile.money - 50 savefile.green = savefile.green + 1 alert("Successfuly bought 1 Green GMO!", "Shop") else alert("You don't have enough gold!", "Shop") end end,art=special_greenpotion,name="1 Green GMO"},{amount=50,callback=function() if savefile.money > 50 then savefile.money = savefile.money - 50 savefile.yellow = savefile.yellow + 1 alert("Successfuly bought 1 Yellow GMO!", "Shop") else alert("You don't have enough gold!", "Shop") end end,art=special_yellowpotion,name="1 Yellow GMO"}}
    currentshopdeal = shopdeals[shopcurrentselected]
    
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
    sprite(thermalexpansion_debugger, 1024-64, 192, 128, 128)
    
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
    elseif currentscreen == "bibliography" then drawbibliography()
    elseif currentscreen == "gmoinfo" then drawgmoinfo()
    elseif currentscreen == "carrotinfo" then drawcarrotinfo()
    elseif currentscreen == "potatoinfo" then drawpotatoinfo()
    elseif currentscreen == "wheatinfo" then drawwheatinfo()
    end
    
    if splashtimeout > 0 then
        noStroke()
        spriteMode(CENTER)
        for x=32, 1024-32, 64 do
            for y=32, 768-32, 64 do
                sprite(railcraft_frostbrick, x, y, 64)
            end
        end
        textMode(CENTER)
        fontSize(50)
        text("Loading...", 512, 384)
        splashtimeout = splashtimeout - 1 
    end
    if splashtimeout == 0 then
        currentscreen = "main"
        splashtimeout = -1
    end
end
-- GMO Game
-- by amtra5

displayMode(OVERLAY)
supportedOrientations(LANDSCAPE_ANY)

-- Use this function to perform your initial setup
function setup()
    savefile = readLocalData("savefile", {tutorial=false,currentblankavaliable=3, currentplots = 3,money=10,blue=1,green=1,yellow=1,fertilizer=0,carrot=0,potato=0,wheat=0,quests={{questname="Welcome",done=false,returnamount=50,questdata={buy={carrot=0,carrotgoal=50}}},{questname="Backyard Gardener",done=false,questdata={harvest={carrot=0,carrotgoal=50,potato=0,potatogoal=50,wheat=0,wheatgoal=50}}},{questname="Small Fry Farmer",done=false,returnamount=0,questdata={harvest={carrot=0,carrotgoal=200,potato=0,potatogoal=200,wheat=0,wheatgoal=200}}},{questname="Family Buisness",done=false,returnamount=0,questdata={harvest={carrot=0,carrotgoal=1000,potato=0,potatogoal=1000,wheat=0,wheatgoal=1000}}},{questname="GMO Student",done=false,returnamount=100,questdata={buy={blue=0,bluegoal=1,green=0,greengoal=1,yellow=0,yellowgoal=1}}},{questname="GMO Graduate",done=false,returnamount=500,questdata={buy={blue=0,bluegoal=10,green=0,greengoal=10,yellow=0,yellowgoal=10}}},{questname="GMO Master",done=false,returnamount=1000,questdata={buy={blue=0,bluegoal=100,green=0,greengoal=100,yellow=0,yellowgoal=100}}},{questname="Quick Work",done=false,returnamount=100,questdata={buy={fertilizer=0,fertilizergoal=3}}},{questname="Addicted",done=false,returnamount=1000000,questdata={harvest={carrot=0,carrotgoal=100000,potato=0,potatogoal=100000,wheat=0,wheatgoal=100000}}}},slots={{x=128,y=128,tiletype="locked",tiledata={}},{x=256,y=128,tiletype="locked",tiledata={}},{x=384,y=128,tiletype="locked",tiledata={}},{x=512,y=128,tiletype="locked", tiledata={}},{x=640,y=128,tiletype="locked",tiledata={}},{x=768,y=128,tiletype="locked",tiledata={}},{x=128,y=256,tiletype="locked",tiledata={}},{x=256,y=256,tiletype="locked",tiledata={}},{x=384,y=256,tiletype="locked",tiledata={}},{x=512,y=256,tiletype="locked",tiledata={}},{x=640,y=256,tiletype="locked",tiledata={}},{x=768,y=256,tiletype="locked",tiledata={}},{x=128,y=384,tiletype="locked",tiledata={}},{x=256,y=384,tiletype="locked",tiledata={}},{x=384,y=384,tiletype="locked",tiledata={}},{x=512,y=384,tiletype="locked",tiledata={}},{x=640,y=384,tiletype="locked",tiledata={}},{x=768,y=384,tiletype="locked",tiledata={}},{x=128,y=512,tiletype="blank",tiledata={}},{x=256,y=512,tiletype="blank",tiledata={}},{x=384,y=512,tiletype="blank",tiledata={}},{x=512,y=512,tiletype="locked",tiledata={}},{x=640,y=512,tiletype="locked",tiledata={}},{x=768,y=512,tiletype="locked",tiledata={}}}})
    
    music("Game Music One:Nothingness", true)
    currentscreen = "splash"
    buystate = 1
    opengmoinfotimeout = -1
    parameter.watch("currentscreen")
    parameter.number("volume", 0, 1, 0)
    lasttouchx = 0
    lasttouchy = 0
    lastdragx = 0
    lastdragy = 0
    lastinteractivemode = "touch"
    currentdragginggmo = "none"
    currentselectedgmoplotno = "none"
    buyingplot = "none"
    splashtimeout = 5
    currenttopquest = 1
    
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
        special_plotshop = "Dropbox:special_plotshop"
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
        minecraft_minecartchest = "Dropbox:sphax_minecraft_minecartchest"
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
        local time = os.date("!*t")
        local currenttime = (time.year*31536000+time.month*7776000+time.day*86400+time.hour*3600+time.min*60+time.sec)
        for plot = 1, #savefile.slots do
            local plotdata = savefile.slots[plot]
            local plotx = plotdata.x
            local ploty = plotdata.y
            if plotdata.tiletype == "blank" then
                sprite(minecraft_tilledsoil, plotx, ploty, 128, 128)
            elseif plotdata.tiletype == "locked" then
                sprite(railcraft_steelblock, plotx, ploty, 128, 128)
                strokeWidth(5)
                stroke(255, 255, 255, 255)
                line(plotx+64, ploty+32, plotx+64, ploty+32+64)
                line(plotx+32, ploty+64, plotx+32+64, ploty+64)
            elseif plotdata.tiletype == "growingcarrot" then
                sprite(minecraft_tilledwetsoil, plotx, ploty, 128, 128)
                sprite(minecraft_carrot, plotx+32, ploty+32, 64, 64)
            elseif plotdata.tiletype == "growingpotato" then
                sprite(minecraft_tilledwetsoil, plotx, ploty, 128, 128)
                sprite(minecraft_potato, plotx+32, ploty+32, 64, 64)
            elseif plotdata.tiletype == "growingwheat" then
                sprite(minecraft_tilledwetsoil, plotx, ploty, 128, 128)
                sprite(minecraft_wheat, plotx+32, ploty+32, 64, 64)
            elseif plotdata.tiletype == "harvest" then
                sprite(minecraft_tilledsoil, plotx, ploty, 128, 128)
                local producttype = plotdata.tiledata.plantdata.art
                local producttypename = string.sub(producttype, 11)
                sprite(minecraft_minecartchest, plotx+32, ploty+32, 64, 64)
                sprite(producttype, plotx+32, ploty+32, 64, 64)
            end
            if plotdata.tiledata.blue and (currentdragginggmo == "blue" or currentdragginggmo == "none") then
                sprite(special_bluepotion, plotx+8, ploty+88, 32, 32)
            end
            if plotdata.tiledata.green and (currentdragginggmo == "green" or currentdragginggmo == "none") then
                sprite(special_greenpotion, plotx+32+8, ploty+88, 32, 32)
            end
            if plotdata.tiledata.yellow and (currentdragginggmo == "yellow" or currentdragginggmo == "none") then
                sprite(special_yellowpotion, plotx+64+8, ploty+88, 32, 32)
            end
            if plotdata.tiletype == "growingcarrot" or plotdata.tiletype == "growingpotato" or plotdata.tiletype == "growingwheat" or plotdata.tiletype == "harvest" then
                plotdata.tiledata.timeend = {year=(plotdata.tiledata.growthstart.year+plotdata.tiledata.plantdata.growtime.y),month=(plotdata.tiledata.growthstart.month+plotdata.tiledata.plantdata.growtime.mo),day=(plotdata.tiledata.growthstart.day+plotdata.tiledata.plantdata.growtime.d),hour=(plotdata.tiledata.growthstart.hour+plotdata.tiledata.plantdata.growtime.h),min=(plotdata.tiledata.growthstart.min+plotdata.tiledata.plantdata.growtime.m),sec=(plotdata.tiledata.growthstart.sec+plotdata.tiledata.plantdata.growtime.s)}
                local plotgrowtime = (plotdata.tiledata.plantdata.growtime.y*31536000+plotdata.tiledata.plantdata.growtime.mo*7776000+plotdata.tiledata.plantdata.growtime.d*86400+plotdata.tiledata.plantdata.growtime.h*3600+plotdata.tiledata.plantdata.growtime.m*60+plotdata.tiledata.plantdata.growtime.s)
                local finishtime = (plotdata.tiledata.timeend.year*31536000+plotdata.tiledata.timeend.month*7776000+plotdata.tiledata.timeend.day*86400+plotdata.tiledata.timeend.hour*3600+plotdata.tiledata.timeend.min*60+plotdata.tiledata.timeend.sec)
                --local timeleft = {year=0,month=0,day=0,hour=0,min=0,sec=finishtime - currenttime}
                if plotdata.tiledata.blue then
                    finishtime = finishtime-plotgrowtime/2
                end
                if plotdata.tiledata.fertilizer then
                    if plotdata.tiledata.fertilizer > 0 then
                        print(plotdata.tiledata.fertilizer)
                        finishtime = finishtime-(plotdata.tiledata.fertilizer*300)
                    end
                end
                local timeleftsec = finishtime-currenttime
                
                if false then -- plotdata.tiledata.blue == 1 then
                    local newendtime = finishtime - (plotgrowtime/2)
                    while newendtime > 60 do
                        newendtime = newendtime - 60
                        plotdata.tiledata.timeend.min = plotdata.tiledata.timeend.min + 1  
                    end
                    while plotdata.tiledata.timeend.min > 60 do
                        plotdata.tiledata.timeend.min = plotdata.tiledata.timeend.min - 60
                        plotdata.tiledata.timeend.hour = plotdata.tiledata.timeend.hour + 1
                    end
                    while plotdata.tiledata.timeend.hour > 24 do
                        plotdata.tiledata.timeend.hour = plotdata.tiledata.timeend.hour - 24
                        plotdata.tiledata.timeend.day = plotdata.tiledata.timeend.day + 1
                    end
                    while plotdata.tiledata.timeend.day > 30 do
                        plotdata.tiledata.timeend.day = plotdata.tiledata.timeend.day - 30
                        plotdata.tiledata.timeend.month = plotdata.tiledata.timeend.month + 1
                    end
                    --bug: will be 1 day longer on the 31st of each month with 31
                    while plotdata.tiledata.timeend.month > 12 do
                        plotdata.tiledata.timeend.month = plotdata.tiledata.timeend.month - 12
                        plotdata.tiledata.timeend.year = plotdata.tiledata.timeend.year + 1
                    end
                end
                if timeleftsec <= -10800 and plotdata.tiletype == "harvest" and not plotdata.tiledata.yellow then
                    plotdata.tiletype = "blank"
                elseif timeleftsec <= 0 then
                    plotdata.tiletype = "harvest"
                else
                    fill(10, 255, 0, 255)
                    stroke(255, 255, 255, 255)
                    noStroke()
                    rectMode(CORNERS)
                    rect(plotx+14, ploty+14, plotx+14+(math.floor(((plotgrowtime-timeleftsec)/plotgrowtime)*100)), ploty+18)
                    noFill()
                    stroke(255, 255, 255, 255)
                    strokeWidth(2)
                    rect(plotx+14, ploty+14, plotx+114, ploty+18)
                end
            end
        end
        
        if lastdragx >= 128 and lastdragy <= 896 and lastdragy >= 128 and lastdragy <= 640 and currentdragginggmo ~= "none" then
            for plot = 1, #savefile.slots do
                plotdata = savefile.slots[plot]
                local plotx = plotdata.x
                local ploty = plotdata.y
                if math.floor(lastdragx/128)*128 == plotx and math.floor(lastdragy/128)*128 == ploty then
                    if plotdata.tiletype == "blank" or plotdata.tiletype == "locked" or savefile[currentdragginggmo] == 0 or plotdata.tiledata[currentdragginggmo] == true or plotdata.tiletype == "harvest" then
                        sprite(special_redshade, plotx, ploty, 128, 128)
                        currentselectedgmoplotno = "none"
                    else
                        sprite(special_greenshade, plotx, ploty, 128, 128)
                        currentselectedgmoplotno = plot
                    end
                end
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
        --if #savefile.quests >= 1 then
        --    drawachievementbox(263, 430, 105, 400)
        --end
        --if #savefile.quests >= 2 then
        --    drawachievementbox(263, 324, 105, 400)
        --end
        --if #savefile.quests >= 3 then
        --    drawachievementbox(263, 218, 105, 400)
        --end
        for i=currenttopquest, currenttopquest+2 do
            local questdata = savefile.quests[i] or false
            if questdata then
                local position = i + 1 - currenttopquest
                
                if questdata.done == "collect" then
                    if position == 1 then
                        drawachievementboxgreen(263, 430, 105, 400)
                    elseif position == 2 then
                        drawachievementboxgreen(263, 324, 105, 400)
                    elseif position == 3 then
                        drawachievementboxgreen(263, 218, 105, 400)
                    end
                else
                    if position == 1 then
                        drawachievementbox(263, 430, 105, 400)
                    elseif position == 2 then
                        drawachievementbox(263, 324, 105, 400)
                    elseif position == 3 then
                        drawachievementbox(263, 218, 105, 400)
                    end
                end
                
                if questdata.done then
                    sprite(cofh_tick, 273, (535-64-20-((position-1)*105)), 64, 64)
                else
                    sprite(cofh_cross, 273, (535-64-20-((position-1)*105)), 64, 64)
                end
                fontSize(20)
                text(i..". "..questdata.questname, 347, (535-40-((position-1)*105)))
                
                fontSize(10)
                if questdata.questdata.buy and not questdata.done then
                    text("Buy:", 347, (535-60-((position-1)*105)))
                    local productcount = 0
                    if questdata.questdata.buy.carrot then
                        productcount = productcount + 1
                        text(questdata.questdata.buy.carrot.."/"..questdata.questdata.buy.carrotgoal, 320+16+(60*productcount), (535-60-((position-1)*105))) 
                        sprite(minecraft_carrot, 320+(60*productcount), (535-60-((position-1)*105)), 16, 16)
                    end
                    if questdata.questdata.buy.potato then
                        productcount = productcount + 1
                        text(questdata.questdata.buy.potato.."/"..questdata.questdata.buy.potatogoal, 320+16+(60*productcount), (535-60-((position-1)*105))) 
                        sprite(minecraft_potato, 320+(60*productcount), (535-60-((position-1)*105)), 16, 16)
                    end
                    if questdata.questdata.buy.wheat then
                        productcount = productcount + 1
                        text(questdata.questdata.buy.wheat.."/"..questdata.questdata.buy.wheatgoal, 320+16+(60*productcount), (535-60-((position-1)*105))) 
                        sprite(minecraft_wheat, 320+(60*productcount), (535-60-((position-1)*105)), 16, 16)
                    end
                    if questdata.questdata.buy.blue then
                        productcount = productcount + 1
                        text(questdata.questdata.buy.blue.."/"..questdata.questdata.buy.bluegoal, 320+16+(60*productcount), (535-60-((position-1)*105))) 
                        sprite(special_bluepotion, 320+(60*productcount), (535-60-((position-1)*105)), 16, 16)
                    end
                    if questdata.questdata.buy.green then
                        productcount = productcount + 1
                        text(questdata.questdata.buy.green.."/"..questdata.questdata.buy.greengoal, 320+16+(60*productcount), (535-60-((position-1)*105))) 
                        sprite(special_greenpotion, 320+(60*productcount), (535-60-((position-1)*105)), 16, 16)
                    end
                    if questdata.questdata.buy.yellow then
                        productcount = productcount + 1
                        text(questdata.questdata.buy.yellow.."/"..questdata.questdata.buy.yellowgoal, 320+16+(60*productcount), (535-60-((position-1)*105))) 
                        sprite(special_yellowpotion, 320+(60*productcount), (535-60-((position-1)*105)), 16, 16)
                    end
                    if questdata.questdata.buy.fertilizer then
                        productcount = productcount + 1
                        text(questdata.questdata.buy.fertilizer.."/"..questdata.questdata.buy.fertilizergoal, 320+16+(60*productcount), (535-60-((position-1)*105))) 
                        sprite(minecraft_bonemeal, 320+(60*productcount), (535-60-((position-1)*105)), 16, 16)
                    end
                end
                if questdata.questdata.harvest and not questdata.done then
                    text("Harvest:", 347, (535-80-((position-1)*105)))
                    local productcount = 0
                    if questdata.questdata.harvest.carrot then
                        productcount = productcount + 1
                        text(questdata.questdata.harvest.carrot.."/"..questdata.questdata.harvest.carrotgoal, 320+16+10+(60*productcount), (535-80-((position-1)*105))) 
                        sprite(minecraft_carrot, 320+10+(60*productcount), (535-80-((position-1)*105)), 16, 16)
                    end
                    if questdata.questdata.harvest.potato then
                        productcount = productcount + 1
                        text(questdata.questdata.harvest.potato.."/"..questdata.questdata.harvest.potatogoal, 320+16+10+(60*productcount), (535-80-((position-1)*105))) 
                        sprite(minecraft_potato, 320+10+(60*productcount), (535-80-((position-1)*105)), 16, 16)
                    end
                    if questdata.questdata.harvest.wheat then
                        productcount = productcount + 1
                        text(questdata.questdata.harvest.wheat.."/"..questdata.questdata.harvest.wheatgoal, 320+16+10+(60*productcount), (535-80-((position-1)*105))) 
                        sprite(minecraft_wheat, 320+10+(60*productcount), (535-80-((position-1)*105)), 16, 16)
                    end
                end
                if questdata.done then
                    text("Collect:", 347, (535-60-((position-1)*105)))
                    text(questdata.returnamount, 330+16+(60), (535-60-((position-1)*105))) 
                    sprite(minecraft_gold, 330+(60), (535-60-((position-1)*105)), 16, 16)
                end
            end
        end
    end
    function updatequests()
        for i=1, #savefile.quests do
            local questdata = savefile.quests[i] or false
            if questdata and questdata.done == false then
                if questdata.questdata.buy then
                    if questdata.questdata.buy.carrot then
                        if questdata.questdata.buy.carrot ~= questdata.questdata.buy.carrotgoal then
                            break
                        end
                    end
                    if questdata.questdata.buy.potato then
                        if questdata.questdata.buy.potato ~= questdata.questdata.buy.potatogoal then
                            break
                        end
                    end
                    if questdata.questdata.buy.wheat then
                        if questdata.questdata.buy.wheat ~= questdata.questdata.buy.wheatgoal then
                            break
                        end
                    end
                    if questdata.questdata.buy.blue then
                        if questdata.questdata.buy.blue ~= questdata.questdata.buy.bluegoal then
                            break
                        end
                    end
                    if questdata.questdata.buy.green then
                        if questdata.questdata.buy.green ~= questdata.questdata.buy.greengoal then
                            break
                        end
                    end
                    if questdata.questdata.buy.yellow then
                        if questdata.questdata.buy.yellow ~= questdata.questdata.buy.yellowgoal then
                            break
                        end
                    end
                    if questdata.questdata.buy.fertilizer then
                        if questdata.questdata.buy.fertilizer ~= questdata.questdata.buy.fertilizer then
                            break
                        end
                    end
                end
                if questdata.questdata.harvest then
                    if questdata.questdata.harvest.carrot then
                        if questdata.questdata.harvest.carrot ~= questdata.questdata.harvest.carrotgoal then
                            break
                        end
                    end
                    if questdata.questdata.harvest.potato then
                        if questdata.questdata.harvest.potato ~= questdata.questdata.harvest.potatogoal then
                            break
                        end
                    end
                    if questdata.questdata.harvest.wheat then
                        if questdata.questdata.harvest.wheat ~= questdata.questdata.harvest.wheatgoal then
                            break
                        end
                    end
                    if questdata.questdata.harvest.blue then
                        if questdata.questdata.harvest.blue ~= questdata.questdata.harvest.bluegoal then
                            break
                        end
                    end
                    if questdata.questdata.buy.green then
                        if questdata.questdata.harvest.green ~= questdata.questdata.harvest.greengoal then
                            break
                        end
                    end
                    if questdata.questdata.harvest.yellow then
                        if questdata.questdata.harvest.yellow ~= questdata.questdata.harvest.yellowgoal then
                            break
                        end
                    end
                    if questdata.questdata.harvest.fertilizer then
                        if questdata.questdata.harvest.fertilizer ~= questdata.questdata.harvest.fertilizer then
                            break
                        end
                    end
                end
                questdata.done = "collect"
            end
        end
    end
    function updatequestinfo(selectmode, selectproduct, selectamount)
        --return
        
        if not selectmode or not selectproduct or not selectamount then return end
        for currentquest=1, #savefile.quests do
            local qdata = savefile.quests[currentquest]
            if qdata.questdata[selectmode] then
                if qdata.questdata[selectmode][selectproduct] then
                    qdata.questdata[selectmode][selectproduct] = qdata.questdata[selectmode][selectproduct] + selectamount
                    if qdata.questdata[selectmode][selectproduct] > qdata.questdata[selectmode][selectproduct.."goal"] then
                        qdata.questdata[selectmode][selectproduct] = qdata.questdata[selectmode][selectproduct.."goal"]
                    end
                end
            end
        end
        
        if  false then --selectmode == "buy" then
            for currentquest=1, #savefile.quests do
                local questdata = savefile.quests[currentquest] or false
                if questdata.questdata.buy then
                    if selectproduct == "carrot" then
                        if questdata.questdata.buy.carrot then
                            print(questdata.questdata.buy.carrot)
                            questdata.questdata.buy.carrot = questdata.questdata.buy.carrot + selectamount
                            if questdata.questdata.buy.carrot > questdata.questdata.buy.carrotgoal then
                                questdata.questdata.buy.carrot = questdata.questdata.buy.carrotgoal
                            end
                        end
                    end
                end
            end
        end
    end
    function drawshop()
        sprite(special_shop, 320, 217)
        sprite(minecraft_gold, 352, 413, 64, 64)
        fontSize(15)
        text(currentshopdeal.amount, 384, 413)
        sprite(currentshopdeal.art, 434, 280, 192, 192)
        fontSize(20)
        text(currentshopdeal.returnamount, 570, 280)
        textMode(CENTER)
        fontSize(15)
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
        --text("Touch anywhere to continue", 512, 170)
        text("GMO Game", 512, 620)
        text("Code - Angus Trau", 512, 550)
        text("Research - Allan Chan, Mark Soo", 512, 535)
        text("Textures:", 512, 505)
        text("Angus Trau", 512, 475)
        text("BDCraft", 512, 490)
        text("Sources:", 512, 445)
        fill(255, 255, 255, 255)
        textMode(CORNER)
        drawachievementbox(368, 180, 64, 128)
        sprite(cofh_info, 368, 180, 64, 64)
        text("Tutorial", 432, 205)
        drawachievementbox(528, 180, 64, 128)
        sprite(cofh_cross, 528, 180, 64, 64)
        text("Close", 592, 205)
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
    function drawbuyplot()
        sprite(special_plotshop, 320, 217)
        sprite(minecraft_gold, 352, 413, 64, 64)
        sprite(railcraft_steelblock, 434, 280, 192, 192)
        text(300+math.pow(savefile.currentplots, 3), 384, 413)
        rectMode(CORNERS)
        noStroke()
        fill(255, 255, 255, 255)
        rect(434+96-4, 280+48, 434+96+4, 280+48+96)
        rect(434+48, 280+96-4, 434+48+96, 280+96+4)
        textMode(CENTER)
        if buystate == 1 then
            text("1 Plot at "..(touchedtilex/128)..", "..5-(touchedtiley/128), 528, 250)
        end
        if buystate == 2 then
            sprite(cofh_block, 354, 341, 64, 64)
            sprite(cofh_tick, 340, 217, 64, 64)
            sprite(cofh_cross, 620, 217, 64, 64)
            text("Are you sure?", 528, 250)
        end
    end
    function touch(tx, ty)
        lasttouchx = tx
        lasttouchy = ty
        lastinteractivemode = "touch"
        print("touch: "..tx..", "..ty)
        if currentscreen == "main" and tx >= 0 and tx <= 128 and ty >= 0 and ty <= 128 then 
            print("button: viewquests")
            updatequests()
            currentscreen = "viewquests" 
        elseif currentscreen == "main" and tx >= 896 and tx <= 1024 and ty >= 0 and ty <= 128 then
            print("button: shop")
            currentscreen = "shop"
        elseif currentscreen == "main" and tx >= 896 and ty <= 1024 and ty >= 128 and ty <= 256 then
            print("button: bibliography")
            currentscreen = "bibliography"
        elseif currentscreen == "main" and ((tx >= 208 and tx <= 368) or (tx >= 432 and tx <= 592) or (tx >= 656 and tx <= 816)) and ty >= 16 and ty <= 80 then
            print("button: gmoinfo")
            --currentscreen = "gmoinfo"
            opengmoinfotimeout = 5
        elseif currentscreen == "main" and tx >= 256 and tx <= 384 and ty >= 688 and ty <= 752 then
            print("button: carrotinfo")
            currentscreen = "carrotinfo"
        elseif currentscreen == "main" and tx >= 448 and tx <= 576 and ty >= 688 and ty <= 752 then
            print("button: potatoinfo")
            currentscreen = "potatoinfo"
        elseif currentscreen == "main" and tx >= 640 and tx <= 768 and ty >= 688 and ty <= 752 then
            print("button: wheatinfo")
            currentscreen = "wheatinfo"
        elseif currentscreen == "gmoinfo" or currentscreen == "carrotinfo" or currentscreen == "potatoinfo" or currentscreen == "wheatinfo" then
            print("button: exittomain")
            currentscreen = "main"
        elseif currentscreen == "main" and tx >= 128 and tx <= 896 and ty >= 128 and ty <= 640 then
            touchtile(tx, ty)
        elseif currentscreen == "viewquests" then
            touchviewquests(tx, ty)
        elseif currentscreen == "shop" or currentscreen == "buyplot" then
            touchshop(tx, ty)
        elseif currentscreen == "bibliography" then
            touchbibliography(tx, ty)
        end
    end
    function touchtile(tx, ty)
        touchedtilex = math.floor(tx/128)*128
        touchedtiley = math.floor(ty/128)*128
        print("touch: tile at "..touchedtilex..", "..touchedtiley)
        for plot = 1, #savefile.slots do
            local plotdata = savefile.slots[plot]
            local plotx = plotdata.x
            local ploty = plotdata.y
            if touchedtilex == plotx and touchedtiley == ploty then
                if plotdata.tiletype == "locked" then
                    print("button: buyplot")
                    buyingplot = plotdata
                    currentscreen = "buyplot"
                elseif plotdata.tiletype == "harvest" then
                    local producttype = plotdata.tiledata.plantdata.art
                    local producttypename = string.sub(producttype, 25)
                    savefile[producttypename] = savefile[producttypename] + plotdata.tiledata.plantdata.returnamount
                    savefile.money = savefile.money + plotdata.tiledata.plantdata.returnamountgold
                    if plotdata.tiledata.green then
                        savefile.money = savefile.money + plotdata.tiledata.plantdata.returnamountgold
                    end
                    plotdata.tiletype = "blank"
                    plotdata.tiledata = {}
                    savefile.currentblankavaliable = savefile.currentblankavaliable + 1
                end
            end
        end
    end
    function touchviewquests(tx, ty)
        if tx >= 729 and tx <= 761 and ty >= 516 and ty <= 546 then
            print("button: exittomain")
            currentscreen = "main"
        elseif tx >= 263 and tx <= 663 and ty >= 218 and ty <= 533 then
            if ty >= 428 and ty <= 533 then
                print("touch: quest1")
                local questno = currenttopquest
                local qdata = savefile.quests[questno] or {done=false}
                if qdata.done == "collect" then
                    savefile.money = savefile.money + qdata.returnamount
                    qdata.done = true
                end
            elseif ty >= 323 and ty <= 428 then
                print("touch: quest2")
                local questno = currenttopquest + 1
                local qdata = savefile.quests[questno] or {done=false}
                if qdata.done == "collect" then
                    savefile.money = savefile.money + qdata.returnamount
                    qdata.done = true
                end
            elseif ty >= 218 and ty <= 323 then
                print("touch: quest3")
                local questno = currenttopquest + 2
                local qdata = savefile.quests[questno] or {done=false}
                if qdata.done == "collect" then
                    savefile.money = savefile.money + qdata.returnamount
                    qdata.done = true
                end
            end
        elseif tx >= 700 and tx <= 745 and ty >= 481 and ty <= 526 and currenttopquest ~= 1 then
            currenttopquest = currenttopquest - 1
        elseif tx >= 700 and tx <= 745 and ty >= 243 and ty <= 287 and currenttopquest+2 ~= #savefile.quests then
            currenttopquest = currenttopquest + 1
        end
    end
    function touchshop(tx, ty)
        if tx >= 637 and tx <= 677 and ty >= 488 and ty <= 524 then
            print("button: exittomain")
            currentscreen = "main"
            buystate = 1
        elseif tx >= 365 and tx <= 409 and ty >= 491 and ty <= 523 and currentscreen == "shop" then
            print("button: shopscrollup")
            if shopcurrentselected == #shopdeals then
                shopcurrentselected = 1
                currentshopdeal = shopdeals[1]
            else
                shopcurrentselected = shopcurrentselected + 1
                currentshopdeal = shopdeals[shopcurrentselected]
            end
            buystate = 1
        elseif tx >= 365 and tx <= 409 and ty >= 304 and ty <= 334 and currentscreen == "shop" then
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
            if currentscreen == "shop" then
                currentshopdeal.callback()
            else
                if savefile.money >= 150+(savefile.currentplots*50) then
                    savefile.money = savefile.money - (260+math.pow(savefile.currentplots, 3))
                    alert("Successfuly bought 1 plot!", "Shop")
                    buystate = 1
                    buyingplot.tiletype = "blank"
                    savefile.currentplots = savefile.currentplots + 1
                    savefile.currentblankavaliable = savefile.currentblankavaliable + 1  
                    currentscreen = "main"
                else
                    alert("You don't have enough gold!", "Shop")
                end
            end
        elseif tx >= 620 and tx <= 684 and ty >= 217 and ty <= 261 and buystate == 2 then
            print("button: cancelbuy")
            buystate = 1
        end
    end
    function touchbibliography(tx, ty)
        if tx >= 368 and tx <= 496 and ty >= 180 and ty <= 244 then
            print("button: tutorial1")
            currentscreen = "tutorial1"
        elseif tx >= 528 and tx <= 656 and ty >= 180 and ty <= 244 then
            print("button: exittomain")
            currentscreen = "main"
        end
    end
    function drag(dx, dy, dtx, dty)
        opengmoinfotimeout = -1
        lastinteractivemode = "drag"
        lastdragx = dtx
        lastdragy = dty
        print("drag: from "..dtx..", "..dty.." to "..dtx+dx..", "..dty+dy)
        if currentscreen == "main" and dtx >= 208 and dtx <= 368 and dty >= 16 and dty <= 80 then
            currentdragginggmo = "blue"
        elseif currentscreen == "main" and dtx >= 432 and dtx <= 592 and dty >= 16 and dty <= 80 then
            currentdragginggmo = "green"
        elseif currentscreen == "main" and dtx >= 656 and dtx <= 816 and dty >= 16 and dty <= 80 then
            currentdragginggmo = "yellow"
        elseif currentscreen == "main" and dtx >= 832 and dtx <= 960 and dty >= 688 and dty <= 752 then
            currentdragginggmo = "fertilizer"
        end
    end
    function interactend()
        if lastinteractivemode == "touch" then 
            
        else
            if lastdragx >= 128 and lastdragx <= 896 and lastdragy >= 128 and lastdragy <= 640 and currentselectedgmoplotno ~= "none" then
                savefile.slots[currentselectedgmoplotno].tiledata[currentdragginggmo] = savefile.slots[currentselectedgmoplotno].tiledata[currentdragginggmo] or 0
                savefile.slots[currentselectedgmoplotno].tiledata[currentdragginggmo] = savefile.slots[currentselectedgmoplotno].tiledata[currentdragginggmo] + 1
                savefile[currentdragginggmo] = savefile[currentdragginggmo] - 1
            
                --local plotdata = savefile.slots[currentselectedgmoplotno]
                --if currentdragginggmo == "blue" then
                    --print(1)
                    --print(2)
                    --local oldtimeend = plotdata.tiledata.timeend
                    --plotdata.tiledata.timeend = {year=(plotdata.tiledata.growthstart.year+plotdata.tiledata.plantdata.growtime.y),month=(plotdata.tiledata.growthstart.month+plotdata.tiledata.plantdata.growtime.mo),day=(plotdata.tiledata.growthstart.day+plotdata.tiledata.plantdata.growtime.d),hour=(plotdata.tiledata.growthstart.hour+plotdata.tiledata.plantdata.growtime.h),min=(plotdata.tiledata.growthstart.min+plotdata.tiledata.plantdata.growtime.m),sec=(plotdata.tiledata.growthstart.sec+plotdata.tiledata.plantdata.growtime.s)}
                    --print(3)
                    --local plotgrowtime = (plotdata.tiledata.plantdata.growtime.y*31536000+plotdata.tiledata.plantdata.growtime.mo*7776000+plotdata.tiledata.plantdata.growtime.d*86400+plotdata.tiledata.plantdata.growtime.h*3600+plotdata.tiledata.plantdata.growtime.m*60+plotdata.tiledata.plantdata.growtime.s)
                    --print(4)
                    --local finishtime = (oldtimeend.year*31536000+oldtimeend.month*7776000+oldtimeend.day*86400+oldtimeend.hour*3600+oldtimeend.min*60+oldtimeend.sec)
                    --local newendtime = finishtime - (plotgrowtime/2)
                    --print(newendtime)
                    --local newtime = {year=0,month=0,day=0,hour=0,min=0,sec=0}
                    --while newendtime >= 60 do
                    --    newendtime = newendtime - 60
                    --    newtime.min = newtime.min + 1
                    --end
                    --newtime.sec = newendtime
                    --while plotdata.tiledata.timeend.min > 60 do
                    --    plotdata.tiledata.timeend.min = plotdata.tiledata.timeend.min - 60
                    --    plotdata.tiledata.timeend.hour = plotdata.tiledata.timeend.hour + 1
                    --end
                    --while plotdata.tiledata.timeend.hour > 24 do
                    --    plotdata.tiledata.timeend.hour = plotdata.tiledata.timeend.hour - 24
                    --    plotdata.tiledata.timeend.day = plotdata.tiledata.timeend.day + 1
                    --end
                    --while plotdata.tiledata.timeend.day > 30 do
                    --    plotdata.tiledata.timeend.day = plotdata.tiledata.timeend.day - 30
                    --    plotdata.tiledata.timeend.month = plotdata.tiledata.timeend.month + 1
                    --end
                    ----bug: will be 1 day longer on the 31st of each month with 31
                    --while plotdata.tiledata.timeend.month > 12 do
                    --    plotdata.tiledata.timeend.month = plotdata.tiledata.timeend.month - 12
                    --    plotdata.tiledata.timeend.year = plotdata.tiledata.timeend.year + 1
                    --end
                --end
            end
            currentdragginggmo = "none"
            currentselectedgmoplotno = "none"
        end
    end
    function plant(product, productdata)
        print("button: buy "..product)
        if savefile.money >= productdata.amount and savefile.currentblankavaliable > 0 then
            savefile.money = savefile.money - productdata.amount
            for plot = 1, 24 do
                if savefile.slots[plot].tiletype == "blank" then
                    if product == "50carrot" then
                        savefile.slots[plot].tiletype = "growingcarrot"
                        alert("Successfuly bought 50 carrots!", "Store")
                        updatequestinfo("buy", "carrot", 50)
                    elseif product == "100carrot" then
                        savefile.slots[plot].tiletype = "growingcarrot"
                        alert("Successfuly bought 100 carrots!", "Store")
                        updatequestinfo("buy", "carrot", 100)
                    elseif product == "1000carrot" then
                        savefile.slots[plot].tiletype = "growingcarrot"
                        alert("Successfuly bought 1000 carrots!", "Store")
                        updatequestinfo("buy", "carrot", 1000)
                    elseif product == "50potato" then
                        savefile.slots[plot].tiletype = "growingpotato"
                        alert("Successfuly bought 50 potatos!", "Shop")
                        updatequestinfo("buy", "potato", 50)
                    elseif product == "100potato" then
                        savefile.slots[plot].tiletype = "growingpotato"
                        alert("Successfuly bought 100 potatos!", "Shop")
                        updatequestinfo("buy", "potato", 100)
                    elseif product == "1000potato" then
                        savefile.slots[plot].tiletype = "growingpotato"
                        alert("Successfuly bought 1000 potatos!", "Shop")
                        updatequestinfo("buy", "potato", 1000)
                    elseif product == "50wheat" then
                        savefile.slots[plot].tiletype = "growingwheat"
                        alert("Successfuly bought 50 wheat!", "Shop")
                        updatequestinfo("buy", "wheat", 50)
                    elseif product == "100wheat" then
                        savefile.slots[plot].tiletype = "growingwheat"
                        alert("Successfuly bought 100 wheat!", "Shop")
                        updatequestinfo("buy", "wheat", 100)
                    elseif product == "1000wheat" then
                        savefile.slots[plot].tiletype = "growingwheat"
                        alert("Successfuly bought 1000 wheat!", "Shop")
                        updatequestinfo("buy", "wheat", 1000)
                    end
                    savefile.slots[plot].tiledata.growthstart = os.date("!*t")
                    savefile.slots[plot].tiledata.plantdata = productdata
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
    
    resettextures()
    sphax_set()
    shopcurrentselected = 1
    shopdeals = {{amount=10,returnamount=50,returnamountgold=13,callback=function() plant("50carrot",shopdeals[1]) end,art=minecraft_carrot,name="50 Carrots",growtime={y=0,mo=0,d=0,h=0,m=2,s=0}},{amount=20,returnamount=100,returnamountgold=30,callback=function() plant("100carrot", shopdeals[2]) end,art=minecraft_carrot,name="100 Carrots",growtime={y=0,mo=0,d=0,h=0,m=4,s=0}},{amount=200,returnamount=1000,returnamountgold=400,callback=function() plant("1000carrot", shopdeals[3]) end,art=minecraft_carrot,name="1000 Carrots",growtime={y=0,mo=0,d=0,h=0,m=40,s=0}},{amount=20,returnamount=50,returnamountgold=26,callback=function() plant("50potato", shopdeals[4]) end,art=minecraft_potato,name="50 Potatos",growtime={y=0,mo=0,d=0,h=0,m=5,s=0}},{amount=40,returnamount=100,returnamountgold=60,callback=function() plant("100potato", shopdeals[5]) end,art=minecraft_potato,name="100 Potatos",growtime={y=0,mo=0,d=0,h=0,m=10,s=0}},{amount=400,returnamount=1000,returnamountgold=800,callback=function() plant("1000potato", shopdeals[6]) end,art=minecraft_potato,name="1000 Potatos",growtime={y=0,mo=0,d=0,h=1,m=40,s=0}},{amount=30,returnamount=50,returnamountgold=37,callback=function() plant("50wheat", shopdeals[7]) end,art=minecraft_wheat,name="50 Wheat",growtime={y=0,mo=0,d=0,h=0,m=10,s=0}},{amount=60,returnamount=100,returnamountgold=90,callback=function() plant("100wheat", shopdeals[8]) end,art=minecraft_wheat,name="100 Wheat",growtime={mo=0,d=0,h=0,m=20,s=0}},{amount=600,returnamount=1000,returnamountgold=1200,callback=function() plant("1000wheat", shopdeals[9]) end,art=minecraft_wheat,name="1000 Wheat",growtime={y=0,mo=0,d=0,h=3,m=20,s=0}},{amount=30,returnamount=1,callback=function() if savefile.money > 30 then savefile.money = savefile.money - 30 savefile.fertilizer = savefile.fertilizer + 1 alert("Successfuly bought 1 fertilizer!", "Shop") updatequestinfo("buy", "fertilizer", 1) else alert("You don't have enough gold!", "Shop") end end,art=minecraft_bonemeal,name="1 Fertilizer"},{amount=50,returnamount=1,callback=function() if savefile.money > 50 then savefile.money = savefile.money - 50 savefile.blue = savefile.blue + 1 alert("Successfuly bought 1 Blue GMO!", "Shop") updatequestinfo("buy", "blue", 1) else alert("You don't have enough gold!", "Shop") end end,art=special_bluepotion,name="1 Blue GMO"},{amount=50,returnamount=1,callback=function() if savefile.money > 50 then savefile.money = savefile.money - 50 savefile.green = savefile.green + 1 alert("Successfuly bought 1 Green GMO!", "Shop") updatequestinfo("buy", "green", 1) else alert("You don't have enough gold!", "Shop") end end,art=special_greenpotion,name="1 Green GMO"},{amount=50,returnamount=1,callback=function() if savefile.money > 50 then savefile.money = savefile.money - 50 savefile.yellow = savefile.yellow + 1 alert("Successfuly bought 1 Yellow GMO!", "Shop") updatequestinfo("buy", "yellow", 1) else alert("You don't have enough gold!", "Shop") end end,art=special_yellowpotion,name="1 Yellow GMO"}}
    currentshopdeal = shopdeals[shopcurrentselected]
    
    fps = math.floor(DeltaTime*60*60)
    parameter.watch("fps")
    parameter.watch("currentdragginggmo")
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
    if CurrentTouch.state == MOVING and (lastdragx ~= CurrentTouch.x or lastdragy ~= CurrentTouch.y) then drag(CurrentTouch.deltaX, CurrentTouch.deltaY, CurrentTouch.x, CurrentTouch.y) end
    if CurrentTouch.state == ENDED then interactend() end

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
    if savefile.money >= 1000 and savefile.money <= 999999 then
        text((math.floor(savefile.money/100)/10).."K", 64+64+8, 768-58)
    elseif savefile.money >= 100000 then
        text((math.floor(savefile.money/100000)/10).."M", 64+64+8, 768-58)
    else
        text(savefile.money, 64+64+8, 768-58)
    end
    if savefile.carrot >= 1000 and savefile.carrot <= 999999 then
        text((math.floor(savefile.carrot/100)/10).."K", 256+64+8, 768-58)
    elseif savefile.carrot >= 100000 then
        text((math.floor(savefile.carrot/100000)/10).."M", 256+64+8, 768-58)
    else
        text(savefile.carrot, 256+64+8, 768-58)
    end
    if savefile.potato >= 1000 and savefile.potato <= 999999 then
        text((math.floor(savefile.potato/100)/10).."K", 448+64+8, 768-58)
    elseif savefile.potato >= 100000 then
        text((math.floor(savefile.potato/100000)/10).."M", 448+64+8, 768-58)
    else
        text(savefile.potato, 448+64+8, 768-58)
    end
    if savefile.wheat >= 1000 and savefile.wheat <= 999999 then
        text((math.floor(savefile.wheat/100)/10).."K", 640+64+8, 768-58)
    elseif savefile.wheat >= 100000 then
        text((math.floor(savefile.wheat/100000)/10).."M", 640+64+8, 768-58)
    else
        text(savefile.wheat, 640+64+8, 768-58)
    end
    if savefile.fertilizer >= 1000 and savefile.fertilizer <= 999999 then
        text((math.floor(savefile.fertilizer/100)/10).."K", 832+64+8, 768-58)
    elseif savefile.fertilizer >= 100000 then
        text((math.floor(savefile.fertilizer/100000)/10).."M", 832+64+8, 768-58)
    else
        text(savefile.fertilizer, 832+64+8, 768-58)
    end
    if savefile.blue >= 1000 and savefile.blue <= 999999 then
        text((math.floor(savefile.blue/100)/10).."K", 208+64+8, 38)
    elseif savefile.blue >= 100000 then
        text((math.floor(savefile.blue/100000)/10).."M", 208+64+8, 38)
    else
        text(savefile.blue, 208+64+8, 38)
    end
    if savefile.green >= 1000 and savefile.green <= 999999 then
        text((math.floor(savefile.green/100)/10).."K", 432+64+8, 38)
    elseif savefile.green >= 100000 then
        text((math.floor(savefile.green/100000)/10).."M", 432+64+8, 38)
    else
        text(savefile.green, 432+64+8, 38)
    end
    if savefile.yellow >= 1000 and savefile.yellow <= 999999 then
        text((math.floor(savefile.yellow/100)/10).."K", 656+64+8, 38)
    elseif savefile.yellow >= 100000 then
        text((math.floor(savefile.yellow/100000)/10).."M", 656+64+8, 38)
    else
        text(savefile.yellow, 656+64+8, 38)
    end
    
    if currentscreen == "main" then drawmain() 
    elseif currentscreen == "viewquests" then drawviewquests()
    elseif currentscreen == "shop" then drawshop()
    elseif currentscreen == "bibliography" then drawbibliography()
    elseif currentscreen == "gmoinfo" then drawgmoinfo()
    elseif currentscreen == "carrotinfo" then drawcarrotinfo()
    elseif currentscreen == "potatoinfo" then drawpotatoinfo()
    elseif currentscreen == "wheatinfo" then drawwheatinfo()
    elseif currentscreen == "buyplot" then drawbuyplot()
    elseif currentscreen == "tutorial1" then sprite("Dropbox:cofh_block", 0, 0, 1024, 768)
    end
    
    fps = math.floor(DeltaTime*60*60)
    
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
        if not savefile.tutorial then
            currentscreen = "tutorial1"
        else
            currentscreen = "main"
        end
        splashtimeout = -1
    end
    if opengmoinfotimeout > 0 then
        opengmoinfotimeout = opengmoinfotimeout - 1
    end
    if opengmoinfotimeout == 0 then
        opengmoinfotimeout = -1
        currentscreen = "gmoinfo"
    end
    --savefile.money = 1000000000
    
    music.volume = volume
end
function onCreatePost()
    makeLuaText("Ported", "Port By WinterND", 500, 30, 50)
    setTextAlignment("Ported", "right")
    scaleObject('Ported',1, 1)
    setProperty('Ported.alpha', 0.75)
    setTextFont('Ported', 'ND.ttf');       
    setProperty('Ported.x', 770)
    setProperty('Ported.y', 5)
    addLuaText("Ported")
end
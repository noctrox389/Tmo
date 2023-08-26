function onCreate()
    makeLuaSprite('hcz','scp/hcz',-475,-350)
    addLuaSprite('hcz',false)
    scaleObject('hcz',2, 2)   
    
    makeLuaSprite('blow','scp/blow',-475,-350)
    addLuaSprite('blow',true)
    scaleObject('blow',2, 2)   
    setProperty('blow.alpha', 1);
    
    makeLuaSprite('multiply','scp/multiply',-475,-350)
    addLuaSprite('multiply',true)
    scaleObject('multiply',2, 2)   
    setProperty('multiply.alpha', 1);
    setBlendMode('multiply','multiply')
end
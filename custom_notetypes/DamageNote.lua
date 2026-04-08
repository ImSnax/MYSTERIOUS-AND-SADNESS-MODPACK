local damageAmount = 0.2

function onCreate()
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'DamageNote' then
            
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/DamageNote')       
            
  setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.texture', 'noteSplashes/DamageNoteSplashes');           
  
  setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.r', 0xFF0000);
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.g', 0x00FF00);
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.b', 0x0000FF);               
            setPropertyFromGroup('unspawnNotes', i, 'ratingDisabled', true)
            
  setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true)
  
  setPropertyFromGroup('unspawnNotes', i, 'hitHealth', 0)
  
  setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0)
  
           setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)

            if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
                           setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
                setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true)
            end
        end
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'DamageNote' then
        
        setProperty('health', getProperty('health') - damageAmount)

        characterPlayAnim('boyfriend', 'hurt', true)
        setProperty('boyfriend.specialAnim', true)
    end
end
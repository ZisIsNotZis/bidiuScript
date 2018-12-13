require 'expansions.script.c2150000'
function c2150002.initial_effect(c)
	BiDiu(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_SINGLE)
	e:SetCode(EFFECT_INDESTRUCTABLE)
	e:SetRange(LOCATION_MZONE)
	e:SetValue(1)
	c:RegisterEffect(e)
	e=e:Clone()
	e:SetCode(EFFECT_CANNOT_BE_EFFECT_TARGET)
	c:RegisterEffect(e)
	e=e:Clone()
	e:SetCode(EFFECT_IGNORE_BATTLE_TARGET)
	c:RegisterEffect(e)
end
	

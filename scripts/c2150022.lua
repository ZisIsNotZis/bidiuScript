require 'expansions.script.c2150020'
function c2150022.initial_effect(c)
	local e=Man.e(c)
	e:SetOperation(c2150022.t)
	e:SetOperation(c2150022.o)
end
function c2150022.t(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	e:SetLabel(Duel.SelectDisableField(tp,1,0,LOCATION_MZONE,0)*4)
end
function c2150022.o(e,tp)
	local a=Effect.CreateEffect(e:GetHandler())
	a:SetType(EFFECT_TYPE_FIELD)
	a:SetCode(EFFECT_DISABLE_FIELD)
	a:SetRange(LOCATION_MZONE)
	a:SetProperty(EFFECT_FLAG_REPEAT)
	a:SetValue(bit.rshift(e:GetLabel(),2))
	a:SetReset(RESETS_STANDARD)
	e:GetHandler():RegisterEffect(a)
	e:SetLabel(2)
end
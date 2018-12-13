require 'expansions.script.c2150000'
function c2150006.initial_effect(c)
	BiDiu(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_O)
	e:SetCode(EVENT_FREE_CHAIN)
	e:SetRange(LOCATION_GRAVE)
	e:SetCountLimit(1)
	e:SetTarget(c2150006.t)
	e:SetOperation(c2150006.o)
	c:RegisterEffect(e)
end
function c2150006.t(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():GetTurnID()+1==Duel.GetTurnCount() and Duel.GetFieldGroupCount(0,LOCATION_ONFIELD,LOCATION_ONFIELD)>0 end
end
function c2150006.o(e,tp)
	local t=Duel.SelectMatchingCard(nil,tp,0,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
	local a=Effect.CreateEffect(e:GetHandler())
	a:SetType(EFFECT_TYPE_SINGLE)
	a:SetCode(EFFECT_CANNOT_TRIGGER)
	a:SetRange(LOCATION_ONFIELD)
	a:SetReset(RESET_EVENT+RESET_LEAVE)
	t:RegisterEffect(a)
if t:IsRelateToEffect(e) then Duel.SendtoDeck(e:GetHandler(),nil,2,REASON_EFFECT) end
end

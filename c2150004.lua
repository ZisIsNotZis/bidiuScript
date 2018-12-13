require 'expansions.script.c2150000'
function c2150004.initial_effect(c)
	BiDiu(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_O)
	e:SetCode(EVENT_FREE_CHAIN)
	e:SetRange(LOCATION_MZONE)
	e:SetCategory(CATEGORY_DESTROY+CATEGORY_DRAW)
	e:SetCountLimit(1,2150004+EFFECT_COUNT_CODE_DUEL)
	e:SetTarget(c2150004.t)
	a:SetOperation(c2150004.o)
	c:RegisterEffect(a)
end
function c2150004.t(e,tp,eg,ep,ev,re,r,rp,chk)
	local g=Duel.GetMatchingGroup(c2150004.f,0,LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED,LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED,nil,e:GetHandler:GetFieldId())
	if chk==0 then return g:GetCount()>0 and Duel.IsPlayerCanDraw(tp,1) end
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,g:GetCount(),0,0)
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,1)
	Duel.SetChainLimit(aux.FALSE)
end
function c2150004.o(e,tp)
	local g=Duel.GetMatchingGroup(c2150004.f,0,LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED,LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED,nil,e:GetHandler:GetFieldId())
	Duel.SendtoDeck(g,nil,2,REASON_EFFECT)
	Duel.Draw(tp,1,REASON_EFFECT)
end

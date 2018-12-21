require 'expansions.script.c2150000'
function c2150004.initial_effect(c)
	BiDiu.e(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e:SetCode(EVENT_TO_DECK)
	e:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY)
	e:SetCountLimit(1,2150004+EFFECT_COUNT_CODE_DUEL)
	e:SetCategory(CATEGORY_DRAW)
	e:SetTarget(c2150004.t)
	e:SetOperation(c2150004.o)
	c:RegisterEffect(e)
	local f=Effect.CreateEffect(c)
	f:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	f:SetCode(EVENT_LEAVE_FIELD_P)
	f:SetRange(LOCATION_MZONE)
	f:SetOperation(c2150004.rego)
	f:SetLabelObject(e)
	c:RegisterEffect(f)
end
function c2150004.rego(e)
	e:GetLabelObject():SetLabel(e:GetHandler():GetFieldID())
end
function c2150004.f(c,n,m)
	return c:GetFieldID()>=n and c:GetFieldID()<=m
end
function c2150004.t(e,tp,eg,ep,ev,re,r,rp,chk)
	local g=Duel.GetMatchingGroup(c2150004.f,0,LOCATION_EXTRA+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED,LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED,nil,e:GetLabel(),e:GetHandler():GetFieldID())
	if chk==0 then return g:GetCount()>0 and Duel.IsPlayerCanDraw(tp,2) end
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,g:GetCount(),0,0)
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,2)
	Duel.SetChainLimit(aux.FALSE)
end
function c2150004.o(e,tp)
	local g=Duel.GetMatchingGroup(c2150004.f,0,LOCATION_EXTRA+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED,LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED,nil,e:GetLabel(),e:GetHandler():GetFieldID())
	Duel.SendtoDeck(g,nil,2,REASON_EFFECT)
	Duel.Draw(tp,2,REASON_EFFECT)
end

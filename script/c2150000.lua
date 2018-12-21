if not BiDiu then
	BiDiu = {}
	function BiDiu.f(c,e,tp)
		return c:IsSetCard(0x215) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
	end
	function BiDiu.f3(c)
		return c:IsFaceup() and c:IsSetCard(0x215)
	end
	function BiDiu.f2(c)
		return c:IsFaceup() and c:IsCode(2150008) and c:IsLevel(3)
	end
	function BiDiu.t(e,tp,eg,ep,ev,re,r,rp,chk)
		if chk==0 then return (Duel.IsExistingMatchingCard(BiDiu.f3,tp,LOCATION_MZONE,0,1,nil) or (Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and Duel.IsExistingMatchingCard(BiDiu.f3,tp,LOCATION_SZONE,0,1,nil,0x215))) and Duel.IsExistingMatchingCard(BiDiu.f,tp,LOCATION_DECK,0,1,nil,e,tp) end
		Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_DECK)
	end
	function BiDiu.c(e,tp,eg,ep,ev,re,r,rp,chk)
		local h=e:GetHandler()
		if chk==0 then return h:IsAbleToDeckAsCost() end
		Duel.SendtoDeck(h,nil,2,REASON_COST)
	end
	function BiDiu.o(e,tp)
		if Duel.IsExistingMatchingCard(BiDiu.f2,tp,LOCATION_MZONE,0,1,nil) and Duel.SelectYesNo(tp,aux.Stringid(2150008,0)) then
			local g=Duel.SelectMatchingCard(tp,BiDiu.f2,tp,LOCATION_MZONE,0,1,1,nil):GetFirst()
			local a=Effect.CreateEffect(e:GetHandler())
			a:SetType(EFFECT_TYPE_SINGLE)
			a:SetCode(EFFECT_UPDATE_LEVEL)
			a:SetRange(LOCATION_MZONE)
			a:SetValue(-2)
			a:SetReset(RESET_EVENT+RESETS_STANDARD)
			g:RegisterEffect(a)
		else
			Duel.SendtoDeck(Duel.SelectMatchingCard(tp,BiDiu.f3,tp,Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and LOCATION_ONFIELD or LOCATION_MZONE,0,1,1,nil),nil,2,REASON_EFFECT)
		end
		Duel.SpecialSummon(Duel.SelectMatchingCard(tp,BiDiu.f,tp,LOCATION_DECK,0,1,1,nil,e,tp),0,tp,tp,false,false,POS_FACEUP)
	end
	function BiDiu.e(c)
		local e=Effect.CreateEffect(c)
		e:SetType(EFFECT_TYPE_QUICK_O)
		e:SetCode(EVENT_FREE_CHAIN)
		e:SetRange(LOCATION_HAND)
		e:SetCategory(CATEGORY_SPECIAL_SUMMON)
		e:SetCost(BiDiu.c)
		e:SetTarget(BiDiu.t)
		e:SetOperation(BiDiu.o)
		c:RegisterEffect(e)
		return e
	end
end
if not c2150000 then return end
function c2150000.initial_effect(c)
	BiDiu.e(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD)
	e:SetCode(EFFECT_SET_POSITION)
	e:SetRange(LOCATION_MZONE)
	e:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
	e:SetValue(POS_FACEUP_DEFENSE)
	e:SetTarget(c2150000.fNoBidiuAtk)
	c:RegisterEffect(e)
	e=e:Clone()
	e:SetCode(EFFECT_SET_ATTACK_FINAL)
	e:SetValue(0)
	e:SetTarget(c2150000.fNoBidiu)
	c:RegisterEffect(e)
	e=e:Clone()
	e:SetCode(EFFECT_SET_DEFENSE_FINAL)
	c:RegisterEffect(e)
	e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e:SetCode(EVENT_LEAVE_FIELD)
	e:SetRange(255)
	e:SetOperation(c2150000.oLeave)
	c:RegisterEffect(e)
end
function c2150000.fNoBidiuAtk(e,c)
	return c:IsFaceup() and not c:IsSetCard(0x215)
end
function c2150000.fNoBidiu(e,c)
	return not c:IsSetCard(0x215)
end
function c2150000.fNoBidiu2(c)
	return not c:IsSetCard(0x215)
end
function c2150000.oLeave(e)
	local h=e:GetHandler()
	local g=Duel.GetMatchingGroup(c2150000.fNoBidiu2,0,LOCATION_MZONE,LOCATION_MZONE,nil)
	local c=g:GetFirst()
	while c do
		e=Effect.CreateEffect(h)
		e:SetType(EFFECT_TYPE_SINGLE)
		e:SetCode(EFFECT_SET_ATTACK_FINAL)
		e:SetRange(LOCATION_MZONE)
		e:SetValue(0)
		e:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END,2)
		c:RegisterEffect(e)
		e=e:Clone()
		e:SetCode(EFFECT_SET_DEFENSE_FINAL)
		c:RegisterEffect(e)
		c=g:GetNext()
	end
end
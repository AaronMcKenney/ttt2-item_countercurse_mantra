if not CURSED then
	return
end

if SERVER then
	AddCSLuaFile()
end

ITEM.EquipMenuData = {
	type = "item_passive",
	name = "item_counter_curse_mantra",
	desc = "item_counter_curse_mantra_desc"
}

ITEM.material = "vgui/ttt/icon_cursed_no_backsies"
ITEM.CanBuy = {ROLE_TRAITOR, ROLE_DETECTIVE}
ITEM.limited = true

if SERVER then
	function ITEM:Equip(buyer)
		buyer:GiveArmor(GetConVar("ttt2_countercurse_mantra_armor"):GetInt())
		--Makes it so that the player can't get tagged by anyone, and will never lose their "no backsies" buff except by round end.
		buyer.curs_last_tagged = -1
		STATUS:AddStatus(buyer, "ttt2_curs_no_backsies")
	end
	
	function ITEM:Reset(buyer)
		buyer:RemoveArmor(GetConVar("ttt2_countercurse_mantra_armor"):GetInt())
		buyer.curs_last_tagged = nil
		STATUS:RemoveStatus(buyer, "ttt2_curs_no_backsies")
	end
end

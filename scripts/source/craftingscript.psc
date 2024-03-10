ScriptName CraftingScript Extends Quest
{ Script attached to Crafting Quest. Has properties and debug quest stages for Crafting and Item Modification }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Actor Property PlayerRef Auto
Perk Property cpl_CompLvlChemical2 Auto
Perk Property cpl_CompLvlChemical3 Auto
Perk Property cpl_CompLvlMetallic2 Auto
Perk Property cpl_CompLvlMetallic3 Auto
Perk Property cpl_CompLvlOrganic2 Auto
Perk Property cpl_CompLvlOrganic3 Auto
Perk Property cpl_CompLvlTechnical2 Auto
Perk Property cpl_CompLvlTechnical3 Auto
Perk[] Property Chemical Auto
Perk[] Property Metallic Auto
Perk[] Property Organic Auto
Perk[] Property Technical Auto

;-- Functions ---------------------------------------

Function ResetComponentLevels()
  PlayerRef.RemovePerk(cpl_CompLvlChemical2)
  PlayerRef.RemovePerk(cpl_CompLvlChemical3)
  PlayerRef.RemovePerk(cpl_CompLvlMetallic2)
  PlayerRef.RemovePerk(cpl_CompLvlMetallic3)
  PlayerRef.RemovePerk(cpl_CompLvlOrganic2)
  PlayerRef.RemovePerk(cpl_CompLvlOrganic3)
  PlayerRef.RemovePerk(cpl_CompLvlTechnical2)
  PlayerRef.RemovePerk(cpl_CompLvlTechnical3)
EndFunction

Function UnlockComponentLevel(Perk[] akComponent, Int NewLevel)
  NewLevel -= 2
  Perk PerkToAdd = akComponent[NewLevel]
  PlayerRef.AddPerk(PerkToAdd, False)
EndFunction

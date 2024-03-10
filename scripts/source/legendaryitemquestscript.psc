ScriptName LegendaryItemQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct AmmoDatum
  Ammo AmmoType
  LeveledItem AmmoLeveledList
  Int Count = 1
EndStruct

Struct LegendaryModRule
  objectmod LegendaryObjectMod
  { A legendary Object Mod
Filter: "mod_Legendary" }
  FormList AllowedKeywords
  { Formlist of keywords ANY of which present on the item means this mod may be added
Note: if none of these keywords are present, the mod can't be added to that item }
  FormList DisallowedKeywords
  { Formlist of keywords ANY of which present on the item means this mod may not be added
Note: this trumps AllowedKeywords }
  Bool AllowGrenades = False
  { Default: false; if true this mod is allowed on grenades }
EndStruct


;-- Variables ---------------------------------------
objectmod[] PreviouslySpawnedMods

;-- Properties --------------------------------------
LeveledItem Property LGND_PossibleLegendaryItemBaseLists Auto Const
{ AUTOFILL
Leveled list holding all the base LL_<Item> lists to use to generate Legendary items }
ActorValue Property SpawnedLegendaryItem Auto Const
{ AUTOFILL used as a "do once" for spawning without having to have the spawning script store a variable }
legendaryitemquestscript:legendarymodrule[] Property LegendaryModRules Auto
{ After the weapon is spawned, check these rules, then add an appropriate legendary mod }
legendaryitemquestscript:ammodatum[] Property AmmoData Auto Const
{ Used to add the correct leveled list of ammo that the spawned item uses }
Int Property iEventType_Starting = 1 Auto Const hidden
Int Property iEventType_Finishing = 2 Auto Const hidden
Int Property iEventType_OnHit = 3 Auto Const hidden
FormList Property WeaponTypeGrenadesKeywordList Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  PreviouslySpawnedMods = new objectmod[0]
EndEvent

Function SendLegendaryMagicEffectEvent(Var[] kArgs)
  Self.SendCustomEvent("legendaryitemquestscript_LegendaryMagicEffectEvent", kArgs)
EndFunction

ObjectReference Function GenerateLegendaryItem(ObjectReference ObjectToSpawnIn, LeveledItem LeveledListOfItemsToSpawn, FormList ListOfSpecificModsToChooseFrom, FormList ListOfSpecificModsToDisallow)
  LeveledItem spawnList = None
  If LeveledListOfItemsToSpawn
    spawnList = LeveledListOfItemsToSpawn
  Else
    spawnList = LGND_PossibleLegendaryItemBaseLists
  EndIf
  If ObjectToSpawnIn.GetValue(SpawnedLegendaryItem) > 0.0
    Return None
  EndIf
  ObjectToSpawnIn.SetValue(SpawnedLegendaryItem, 1.0)
  ObjectReference item = ObjectToSpawnIn.PlaceAtMe(spawnList as Form, 1, False, True, False, None, None, True)
  If item
    
  EndIf
  Self.AddLegendaryMod(item, ListOfSpecificModsToChooseFrom, ListOfSpecificModsToDisallow)
  Weapon itemWeapon = item.GetBaseObject() as Weapon
  If itemWeapon
    Ammo itemAmmo = itemWeapon.GetAmmo()
    If itemAmmo
      Int I = AmmoData.findstruct("AmmoType", itemAmmo, 0)
      If I >= 0
        legendaryitemquestscript:ammodatum itemWeaponAmmoDatum = AmmoData[I]
        ObjectToSpawnIn.addItem(itemWeaponAmmoDatum.AmmoLeveledList as Form, itemWeaponAmmoDatum.Count, False)
      EndIf
    EndIf
  EndIf
  ObjectToSpawnIn.addItem(item as Form, 1, False)
  item.enable(False)
  Return item
EndFunction

Function AddLegendaryMod(ObjectReference item, FormList ListOfSpecificModsToChooseFrom, FormList ListOfSpecificModsToDisallow)
  objectmod[] AllowedMods = Self.GetAllowedMods(item, ListOfSpecificModsToChooseFrom, ListOfSpecificModsToDisallow)
  objectmod[] PreferredMods = new objectmod[0]
  Int I = 0
  While I < AllowedMods.Length
    If PreviouslySpawnedMods.find(AllowedMods[I], 0) < 0
      PreferredMods.add(AllowedMods[I], 1)
    EndIf
    I += 1
  EndWhile
  If PreferredMods.Length == 0
    PreviouslySpawnedMods.clear()
    PreferredMods = AllowedMods
  EndIf
  Int max = PreferredMods.Length
  If max > 0
    Int dieRoll = Utility.RandomInt(0, max - 1)
    objectmod legendaryMod = PreferredMods[dieRoll]
    PreviouslySpawnedMods.add(legendaryMod, 1)
    Bool success = item.AttachMod(legendaryMod, 0)
    If success == False
      
    EndIf
  EndIf
EndFunction

objectmod[] Function GetAllowedMods(ObjectReference item, FormList ListOfSpecificModsToChooseFrom, FormList ListOfSpecificModsToDisallow)
  objectmod[] AllowedMods = new objectmod[0]
  Int I = 0
  While I < LegendaryModRules.Length
    legendaryitemquestscript:legendarymodrule Rule = LegendaryModRules[I]
    objectmod ModToConsider = Rule.LegendaryObjectMod
    Bool continue = !item.HasKeywordInFormList(WeaponTypeGrenadesKeywordList) || Rule.AllowGrenades
    continue = continue && (!ListOfSpecificModsToDisallow || ListOfSpecificModsToDisallow.Find(ModToConsider as Form) <= -1)
    continue = continue && (!ListOfSpecificModsToChooseFrom || ListOfSpecificModsToChooseFrom.Find(ModToConsider as Form) >= 0)
    If Rule.AllowedKeywords
      continue = continue && item.HasKeywordInFormList(Rule.AllowedKeywords)
    EndIf
    If Rule.DisallowedKeywords
      continue = continue && !item.HasKeywordInFormList(Rule.DisallowedKeywords)
    EndIf
    continue = continue && ModToConsider as Bool
    If continue
      AllowedMods.add(ModToConsider, 1)
    EndIf
    I += 1
  EndWhile
  Return AllowedMods
EndFunction

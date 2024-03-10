ScriptName TestNPCCycleFaction Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property teamFactionToChange = 1 Auto Const
{ 1. Red, 2. Blue }
FormList Property AllFactionFormList Auto Const mandatory
{ Form List of FormLists, for complete list of factions }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference SpawnControllerFromLink = Self.GetLinkedRef(None)
  If SpawnControllerFromLink
    FormList oldFactionList = (SpawnControllerFromLink as testnpcarenascript).GetFactionFormList(teamFactionToChange)
    Int currentIndex = AllFactionFormList.Find(oldFactionList as Form)
    Int newIndex = 0
    If currentIndex >= 0
      If currentIndex != AllFactionFormList.GetSize() - 1
        newIndex = currentIndex + 1
      EndIf
      FormList newFactionList = AllFactionFormList.GetAt(newIndex) as FormList
      (SpawnControllerFromLink as testnpcarenascript).SetFactionToSpawn(newFactionList, teamFactionToChange)
    EndIf
  EndIf
EndEvent

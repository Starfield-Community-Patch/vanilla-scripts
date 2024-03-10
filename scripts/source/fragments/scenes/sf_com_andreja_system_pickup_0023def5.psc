ScriptName Fragments:Scenes:SF_COM_Andreja_System_Pickup_0023DEF5 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.PickupSceneEnded()
EndFunction

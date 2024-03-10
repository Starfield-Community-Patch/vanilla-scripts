ScriptName Fragments:Scenes:SF_COM_Barrett_System_Pickup_001C6E1E Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.PickupSceneEnded()
EndFunction

ScriptName Fragments:Scenes:SF_COM_SamCoe_System_PickupS_0026C505 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript
  kmyQuest.PickupSceneEnded()
EndFunction

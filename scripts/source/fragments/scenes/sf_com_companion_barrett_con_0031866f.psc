ScriptName Fragments:Scenes:SF_COM_Companion_Barrett_Con_0031866F Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_11_End()
  com_convoquestscript kmyQuest = Self.GetOwningQuest() as com_convoquestscript
  kmyQuest.SceneCompleted()
EndFunction

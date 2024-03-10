ScriptName Fragments:Scenes:SF_COM_Companion_SarahMorgan_0029B94B Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_06_End()
  com_convoquestscript kmyQuest = Self.GetOwningQuest() as com_convoquestscript
  kmyQuest.SceneCompleted()
EndFunction

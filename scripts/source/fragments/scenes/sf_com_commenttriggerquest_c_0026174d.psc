ScriptName Fragments:Scenes:SF_COM_CommentTriggerQuest_C_0026174D Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_commenttriggerquestscript kmyQuest = Self.GetOwningQuest() as com_commenttriggerquestscript
  kmyQuest.SendAffinityEvent()
EndFunction

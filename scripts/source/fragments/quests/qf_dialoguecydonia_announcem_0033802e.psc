ScriptName Fragments:Quests:QF_DialogueCydonia_Announcem_0033802E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CY_DetonationCount Auto Const mandatory
Scene Property DialogueCydonia_Announcement01_Scene Auto Const mandatory
ReferenceAlias Property Alias_AnnouncementMarker Auto Const mandatory
ReferenceAlias Property Alias_AnnouncementMarkerInt02 Auto Const mandatory
Scene Property DialogueCydonia_Announcement01_Scene_Int02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_1000_Item_00()
  DialogueCydonia_Announcement01_Scene.Stop()
  DialogueCydonia_Announcement01_Scene_Int02.Stop()
  Self.Stop()
EndFunction

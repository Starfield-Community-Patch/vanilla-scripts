ScriptName DefaultCollectionAliasOnMenuItemRun Extends RefCollectionAlias default
{ Default script to set stages and/or send story events when terminal menu items run.) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  defaultaliasonmenuitemrun:menuitemdatum[] Property MenuItemData Auto Const mandatory
  { Array of stages to set when terminal menu items are run. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(ObjectReference akSender, Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  defaultaliasonmenuitemrun.HandleMenuItem(Self as Alias, MenuItemData, auiMenuItemID, akTerminalBase, akTerminalRef, ShowTraces)
EndEvent

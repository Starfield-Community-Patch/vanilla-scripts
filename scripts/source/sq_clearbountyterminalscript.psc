ScriptName SQ_ClearBountyTerminalScript Extends TerminalMenu conditional

;-- Structs -----------------------------------------
Struct CrimeFaction
  Faction theFaction
  GlobalVariable currentBounty
  Int currentBountyCost
EndStruct


;-- Variables ---------------------------------------
sq_clearbountyterminalscript:crimefaction clearBountyCrimeFaction

;-- Properties --------------------------------------
sq_clearbountyterminalscript:crimefaction[] Property CrimeFactions Auto Const
{ factions to calculate current bounty for }
ActorValue Property KioskTerminalNoSaleFlag Auto hidden
{ set to 1 if the player tries to buy something with not enough credits }
TerminalMenu Property SQ_ClearBountyTerminalMenu_Deskop Auto Const mandatory
{ the main terminal menu }
TerminalMenu Property SQ_ClearBountyTerminalMenu_Submenu Auto Const mandatory
{ the submenu for this terminal }
GlobalVariable Property SQ_ClearBountyConvenienceFee Auto Const
{ extra cost for clearing bounty via this terminal }

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalBase == SQ_ClearBountyTerminalMenu_Deskop
    Self.UpdateTextReplacement(akTerminalRef)
  EndIf
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalBase == SQ_ClearBountyTerminalMenu_Deskop && auiMenuItemID < CrimeFactions.Length
    clearBountyCrimeFaction = CrimeFactions[auiMenuItemID]
    If clearBountyCrimeFaction
      akTerminalRef.AddTextReplacementData("ClearFaction", clearBountyCrimeFaction.theFaction as Form)
      akTerminalRef.AddTextReplacementValue("ClearBounty", clearBountyCrimeFaction.currentBounty.GetValueInt() as Float)
      akTerminalRef.AddTextReplacementValue("ClearBountyCost", clearBountyCrimeFaction.currentBountyCost as Float)
      MiscObject credits = Game.GetCredits()
      Actor player = Game.GetPlayer()
      Int playerCredits = player.GetItemCount(credits as Form)
      Int cost = clearBountyCrimeFaction.currentBountyCost
      If playerCredits >= cost
        akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 0.0)
      Else
        akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 1.0)
      EndIf
    EndIf
  ElseIf akTerminalBase == SQ_ClearBountyTerminalMenu_Submenu && auiMenuItemID == 0
    MiscObject credits = Game.GetCredits()
    Actor player = Game.GetPlayer()
    Int playercredits = player.GetItemCount(credits as Form)
    Int cost = clearBountyCrimeFaction.currentBountyCost
    If playercredits >= cost
      akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 0.0)
      player.RemoveItem(credits as Form, cost, False, None)
      clearBountyCrimeFaction.theFaction.SetCrimeGold(0)
      clearBountyCrimeFaction.theFaction.SetCrimeGoldViolent(0)
      clearBountyCrimeFaction.theFaction.SetPlayerEnemy(False)
      Self.UpdateTextReplacement(akTerminalRef)
    Else
      akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 1.0)
    EndIf
  EndIf
EndEvent

Function UpdateTextReplacement(ObjectReference akTerminalRef)
  clearBountyCrimeFaction = None
  Int I = 0
  While I < CrimeFactions.Length
    sq_clearbountyterminalscript:crimefaction theCrimeFaction = CrimeFactions[I]
    Int currentBounty = theCrimeFaction.theFaction.GetCrimeGold()
    theCrimeFaction.currentBountyCost = Math.Round(currentBounty as Float * (1.0 + SQ_ClearBountyConvenienceFee.GetValue()))
    theCrimeFaction.currentBounty.SetValueInt(currentBounty)
    akTerminalRef.AddTextReplacementData("faction" + I as String, theCrimeFaction.theFaction as Form)
    akTerminalRef.AddTextReplacementValue(("faction" + I as String) + "Bounty", currentBounty as Float)
    I += 1
  EndWhile
EndFunction

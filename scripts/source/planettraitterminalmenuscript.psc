ScriptName PlanetTraitTerminalMenuScript Extends TerminalMenu
{ award planet trait discovery data, optionally set a quest stage }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory
{ used to get planet traits }
Int Property DiscoverTraitMenuItemID = 1 Auto Const
{ the ID of the menu item that should discover the planet trait }
Bool Property DiscoverTraitCompletely = True Auto Const
{ TRUE = player fully discovers the trait
    FALSE = player increments discovery as if they had fully explored a trait overlay }
TerminalMenu Property SQ_PlanetTraitTerminalSubmenu Auto Const mandatory
{ autofill }
Int Property DiscoverTraitBodyTextIndex = 0 Auto Const
Int Property NoTraitBodyTextIndex = 1 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  planettraitterminalscript myTerminalRef = akTerminalRef as planettraitterminalscript
  If myTerminalRef as Bool && myTerminalRef.planetToCheck == None
    Form[] textReplacementArray = None
    Int bodyTextIndex = NoTraitBodyTextIndex
    myTerminalRef.planetToCheck = akTerminalRef.GetCurrentPlanet()
    planet planetToCheck = myTerminalRef.planetToCheck
    Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(SQ_Parent.KeywordType_PlanetTrait)
    If matchingKeywords.Length > 0
      Int I = matchingKeywords.Length - 1
      While I > -1
        If planetToCheck.IsTraitKnown(matchingKeywords[I])
          matchingKeywords.remove(I, 1)
        EndIf
        I += -1
      EndWhile
      If matchingKeywords.Length == 0
        matchingKeywords = planetToCheck.GetKeywordTypeList(SQ_Parent.KeywordType_PlanetTrait)
      EndIf
      Int randomKeyword = Utility.RandomInt(0, matchingKeywords.Length - 1)
      myTerminalRef.traitKeywordToDiscover = matchingKeywords[randomKeyword]
      textReplacementArray = Self.GetTextReplacementArray(myTerminalRef)
      bodyTextIndex = DiscoverTraitBodyTextIndex
    EndIf
    SQ_PlanetTraitTerminalSubmenu.ClearDynamicBodyTextItems(myTerminalRef as ObjectReference)
    SQ_PlanetTraitTerminalSubmenu.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, bodyTextIndex, 1, textReplacementArray)
  EndIf
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  planettraitterminalscript myTerminalRef = akTerminalRef as planettraitterminalscript
  If myTerminalRef
    Keyword traitKeywordToDiscover = myTerminalRef.traitKeywordToDiscover
    planet planetToCheck = myTerminalRef.planetToCheck
    If (auiMenuItemID == DiscoverTraitMenuItemID && traitKeywordToDiscover as Bool) && myTerminalRef.traitDataAwarded == False && planetToCheck.IsTraitKnown(traitKeywordToDiscover) == False
      sq_parentscript:planettraitdata theData = SQ_Parent.FindMatchingPlanetTraitForKeyword(traitKeywordToDiscover, planetToCheck)
      myTerminalRef.traitDataAwarded = True
      Int traitScansToAward = 1
      If DiscoverTraitCompletely
        traitScansToAward = 99
      EndIf
      SQ_Parent.UpdatePlanetTraitDiscovery(akTerminalRef, theData, traitScansToAward)
    EndIf
  EndIf
EndEvent

Form[] Function GetTextReplacementArray(planettraitterminalscript myTerminalRef)
  Form[] textReplacementArray = new Form[0]
  textReplacementArray.add(myTerminalRef.traitKeywordToDiscover as Form, 1)
  Return textReplacementArray
EndFunction

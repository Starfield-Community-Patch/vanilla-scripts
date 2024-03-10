ScriptName CityCYRedTape01HRTerminalScript Extends TerminalMenu

;-- Structs -----------------------------------------
Struct EdData
  GlobalVariable EducationValue
  { The value we set for the player's stated Education Level }
  Message EducationMSG
  { The Message to output associated with this level of Education }
EndStruct

Struct ExpData
  GlobalVariable ExperienceValue
  { The value we set for the player's stated Executive Assistant Experience Level }
  Message ExperienceMSG
  { The Message to output associated with this level of experience }
EndStruct

Struct QualityData
  GlobalVariable QualityRangeValue
  { The range value based on the player's City_CY_RedTape01ApplicationTotal value }
  Message QualityMSG
  { The Message to output associated with this range value, based on how well the player answered the questions }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape01_Experience Auto Const mandatory
GlobalVariable Property City_CY_RedTape01_Education Auto Const mandatory
GlobalVariable Property City_CY_RedTape01ApplicationTotal Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Quality01 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Quality02 Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Quality03 Auto Const mandatory
Keyword Property LinkCustom10 Auto Const mandatory
Float Property fDistance = 16.0 Auto Const
TerminalMenu Property City_CY_RedTape01_HRSubTerminal_Applications_Genesis Auto Const mandatory
TerminalMenu Property City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis Auto Const mandatory
Int Property PlayerNameBodyTextIndex = 0 Auto Const
Int Property ExperienceBodyTextIndex = 1 Auto Const
Int Property EducationBodyTextIndex = 2 Auto Const
Int Property QualityBodyTextIndex = 3 Auto Const
Message[] Property ExpMessage Auto Const mandatory
Message[] Property EdMessage Auto Const mandatory
Message[] Property QualityMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Actor myPlayer = Game.GetPlayer()
  Actor myTia = akTerminalRef.GetLinkedRef(LinkCustom10) as Actor
  Float fTiaDistance = myTia.GetDistance(myPlayer as ObjectReference)
  If fTiaDistance < fDistance
    myTia.SendTrespassAlarm(myPlayer)
  EndIf
  terminalscript myTerminalRef = akTerminalRef as terminalscript
  Form[] textReplacementArray = new Form[0]
  textReplacementArray.add(myPlayer as Form, 1)
  Int ExpIndex = City_CY_RedTape01_Experience.GetValue() as Int
  If ExpIndex >= 0 && ExpIndex <= ExpMessage.Length - 1
    Message myExpMsg = ExpMessage[ExpIndex]
    textReplacementArray.add(myExpMsg as Form, 1)
  EndIf
  Int EdIndex = City_CY_RedTape01_Education.GetValue() as Int
  If EdIndex >= 0 && EdIndex <= EdMessage.Length - 1
    Message myEdMsg = EdMessage[EdIndex]
    textReplacementArray.add(myEdMsg as Form, 1)
  EndIf
  Int iTotal = City_CY_RedTape01ApplicationTotal.GetValue() as Int
  Int iQuality = 0
  If iTotal as Float < City_CY_RedTape01Quality01.GetValue()
    iQuality = 0
  ElseIf (iTotal as Float >= City_CY_RedTape01Quality01.GetValue()) && (iTotal as Float < City_CY_RedTape01Quality02.GetValue())
    iQuality = 1
  ElseIf (iTotal as Float >= City_CY_RedTape01Quality02.GetValue()) && (iTotal as Float < City_CY_RedTape01Quality03.GetValue())
    iQuality = 2
  ElseIf iTotal as Float >= City_CY_RedTape01Quality03.GetValue()
    iQuality = 3
  EndIf
  Message myQualityMsg = QualityMessage[iQuality]
  textReplacementArray.add(myQualityMsg as Form, 1)
  akTerminalRef.AddTextReplacementData("PlayerLabel", Game.GetPlayer().GetBaseObject())
  City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, PlayerNameBodyTextIndex, 2, textReplacementArray)
  City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, ExperienceBodyTextIndex, 3, textReplacementArray)
  City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, EducationBodyTextIndex, 4, textReplacementArray)
  City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, QualityBodyTextIndex, 5, textReplacementArray)
EndEvent

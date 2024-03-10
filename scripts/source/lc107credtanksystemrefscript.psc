ScriptName LC107CredTankSystemRefScript Extends ObjectReference
{ Script for refs in the LC107 CredTank System.
 - This script is used for the refs that manage groups of shelves (the Vault, Group, and Cluter managers).
 - This is also the parent script of LC107CredTankShelfRefScript, wich manages the shelves themselves. }

;-- Variables ---------------------------------------
Int CONST_ChildPattern_Linked = -2 Const
Int CONST_ChildPattern_Reversed = -3 Const
Int CONST_ChildPattern_Simultaneous = -1 Const
Int CONST_RefType_ClusterManager = 1 Const
Int CONST_RefType_GroupManager = 2 Const
Int CONST_RefType_ShelfManager = 0 Const
Int CONST_RefType_VaultManager = 3 Const
Int CONST_ShutdownTanksPerThread = 50 Const
Int myChildPattern
lc107credtanksystemrefscript[] myShutdownChildObjects
Int myShutdownCount

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard UpdateGuard

;-- Properties --------------------------------------
Group CredTankSystemBaseProperties collapsedonref
  Int Property CredTankSystemRefType Auto Const
  { The type of ref this script is on, from the list of CONST_RefTypes below. Where this script is in the hierarchy of objects in the Vault. }
  Keyword Property ChildObjectKeyword Auto Const
  { Keyword for the linkedref connecting this ref to its child objects. }
EndGroup

Group AutofillProperties
  lc107questscript Property LC107 Auto Const mandatory
EndGroup

LC107CredTankSystemRefScript Property parentRef Auto hidden
Int Property myOperation Auto hidden
Int Property CONST_Operation_Initialize = 1 Auto Const hidden
Int Property CONST_Operation_Waiting = 2 Auto Const hidden
Int Property CONST_Operation_Responsive = 3 Auto Const hidden
Int Property CONST_Operation_Boot = 4 Auto Const hidden
Int Property CONST_Operation_Drain = 5 Auto Const hidden
Int Property CONST_Operation_Shutdown = 6 Auto Const hidden

;-- Functions ---------------------------------------

Function PerformInitialRegistration(LC107CredTankSystemRefScript myParentObject)
  parentRef = myParentObject
  If parentRef != None
    Self.RegisterForCustomEvent(parentRef as ScriptObject, "lc107credtanksystemrefscript_SimultaneousUpdateEvent")
  EndIf
  If CredTankSystemRefType != CONST_RefType_ShelfManager
    lc107credtanksystemrefscript[] childObjects = Self.GetLinkedRefChain(ChildObjectKeyword, 100) as lc107credtanksystemrefscript[]
    If childObjects != None
      Int I = 0
      While I < childObjects.Length
        childObjects[I].PerformInitialRegistration(Self)
        I += 1
      EndWhile
    EndIf
  EndIf
EndFunction

Function PerformOperation(Int myNewOperation)
  Guard UpdateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    myOperation = myNewOperation
    lc107credtanksystemrefscript[] childObjects = Self.GetLinkedRefChain(ChildObjectKeyword, 100) as lc107credtanksystemrefscript[]
    If childObjects != None
      If myOperation == CONST_Operation_Initialize
        If CredTankSystemRefType == CONST_RefType_VaultManager
          myChildPattern = CONST_ChildPattern_Simultaneous
        ElseIf CredTankSystemRefType == CONST_RefType_GroupManager
          myChildPattern = CONST_ChildPattern_Simultaneous
        ElseIf CredTankSystemRefType == CONST_RefType_ClusterManager
          myChildPattern = CONST_ChildPattern_Linked
        EndIf
      ElseIf myOperation == CONST_Operation_Boot
        If CredTankSystemRefType == CONST_RefType_VaultManager
          myChildPattern = CONST_ChildPattern_Linked
        ElseIf CredTankSystemRefType == CONST_RefType_GroupManager
          myChildPattern = CONST_ChildPattern_Simultaneous
        ElseIf CredTankSystemRefType == CONST_RefType_ClusterManager
          myChildPattern = CONST_ChildPattern_Linked
        EndIf
      ElseIf myOperation == CONST_Operation_Drain
        If CredTankSystemRefType == CONST_RefType_VaultManager
          myChildPattern = CONST_ChildPattern_Linked
        ElseIf CredTankSystemRefType == CONST_RefType_GroupManager
          myChildPattern = CONST_ChildPattern_Simultaneous
        ElseIf CredTankSystemRefType == CONST_RefType_ClusterManager
          myChildPattern = CONST_ChildPattern_Reversed
        EndIf
      ElseIf myOperation == CONST_Operation_Shutdown
        If CredTankSystemRefType == CONST_RefType_VaultManager
          myChildPattern = CONST_ChildPattern_Simultaneous
        ElseIf CredTankSystemRefType == CONST_RefType_GroupManager
          myChildPattern = CONST_ChildPattern_Linked
        ElseIf CredTankSystemRefType == CONST_RefType_ClusterManager
          myChildPattern = CONST_ChildPattern_Linked
        EndIf
      EndIf
      If myChildPattern == CONST_ChildPattern_Linked && myOperation == CONST_Operation_Shutdown && childObjects.Length > CONST_ShutdownTanksPerThread
        myShutdownChildObjects = childObjects
        myShutdownCount = myShutdownChildObjects.Length / CONST_ShutdownTanksPerThread + 1
        Int I = 0
        While I < myShutdownCount
          Var[] akArgs = new Var[1]
          akArgs[0] = I as Var
          Self.CallFunctionNoWait("PerformShutdownOperationThreaded", akArgs)
          I += 1
        EndWhile
      ElseIf myChildPattern == CONST_ChildPattern_Linked
        Int i = 0
        While i < childObjects.Length
          LC107CredTankSystemRefScript currentRef = childObjects[i]
          currentRef.PerformOperation(myOperation)
          If myOperation == CONST_Operation_Boot && CredTankSystemRefType == CONST_RefType_VaultManager
            Utility.Wait(1.5)
          ElseIf myOperation == CONST_Operation_Drain && CredTankSystemRefType == CONST_RefType_VaultManager
            Utility.Wait(1.5)
          ElseIf myOperation == CONST_Operation_Drain && CredTankSystemRefType == CONST_RefType_ClusterManager
            Utility.Wait(0.400000006)
          EndIf
          i += 1
        EndWhile
      ElseIf myChildPattern == CONST_ChildPattern_Reversed
        Int i = childObjects.Length - 1
        While i >= 0
          LC107CredTankSystemRefScript currentref = childObjects[i]
          currentref.PerformOperation(myOperation)
          If myOperation == CONST_Operation_Boot && CredTankSystemRefType == CONST_RefType_ClusterManager
            Utility.Wait(0.100000001)
          ElseIf myOperation == CONST_Operation_Drain && CredTankSystemRefType == CONST_RefType_ClusterManager
            Utility.Wait(0.300000012)
          EndIf
          i -= 1
        EndWhile
      ElseIf myChildPattern == CONST_ChildPattern_Simultaneous
        Var[] akargs = new Var[1]
        akargs[0] = myOperation as Var
        Self.SendCustomEvent("lc107credtanksystemrefscript_SimultaneousUpdateEvent", akargs)
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function PerformShutdownOperationThreaded(Int threadNum)
  Int I = threadNum * CONST_ShutdownTanksPerThread
  Int endIndex = Math.Min((I + CONST_ShutdownTanksPerThread) as Float, myShutdownChildObjects.Length as Float) as Int
  While I < endIndex
    myShutdownChildObjects[I].PerformOperation(myOperation)
    I += 1
  EndWhile
  Guard UpdateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    myShutdownCount -= 1
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event LC107CredTankSystemRefScript.SimultaneousUpdateEvent(LC107CredTankSystemRefScript source, Var[] akArgs)
  Self.PerformOperation(akArgs[0] as Int)
EndEvent

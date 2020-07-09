//=============================================================================
// Base Mutator by Marco
// Edited for custom sounds by Vel-San
// for more information, feedback, questions or requests please contact
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

Class KFZedVoiceChanger extends Mutator;

function PreBeginPlay()
{
	AddToPackageMap();
	AddToPackageMap(Class'KFVP'.Static.GetVoicePackage());
}
simulated function Tick( float Delta )
{
	// Make sure client did download the voice pack too.
	if( Level.NetMode!=NM_DedicatedServer)
		Class'KFVP'.Static.InitializeSoundsFor(Level.GetLocalPlayerController());

	Disable('Tick');
}

defaultproperties
{
     GroupName="KF-ZedVoiceChanger"
     FriendlyName="ZED Voice Changer Mut"
     Description="Changes Fleshpound, Scrake & Patriach Attack Sound Effects - More sounds to be added soon!"
     bAlwaysRelevant=True
     RemoteRole=ROLE_SimulatedProxy
}

//=============================================================================
// Base Mutator by Marco
// Edited for custom FP Sound by Vel-San
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
     GroupName="KF-VoiceChanger"
     FriendlyName="Voice Changer Mut"
     Description="Changes some ZED Voices (e.g. FP Rage); By Vel-San"
     bAlwaysRelevant=True
     RemoteRole=ROLE_SimulatedProxy
}

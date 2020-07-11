//=============================================================================
// Base Mutator by Marco
// Edited for custom sounds by Vel-San
// for more information, feedback, questions or requests please contact
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

Class KFZedVoiceChanger extends Mutator config(KFZedVoiceChanger);

#exec OBJ LOAD FILE=KF_VP.uax

var() config bool bSiren, bScrake, bFleshP, bPatty, bBloat;

function PreBeginPlay()
{
	AddToPackageMap();
	AddToPackageMap(Class'KFVP'.Static.GetVoicePackage());
}

simulated function Tick( float Delta )
{
	// Make sure client did download the voice pack too.
	if( Level.NetMode!=NM_DedicatedServer){
		Class'KFVP'.Static.InitializeSoundsFor(Level.GetLocalPlayerController());
	}
	Disable('Tick');
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	Super.FillPlayInfo(PlayInfo);
    // PlayInfo.AddSetting("KFZedVoiceChanger", "bSiren", "Siren", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bScrake", "Scrake", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bFleshP", "FleshPound", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bPatty", "Patty Daddy", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bBloat", "Bloat", 0, 0, "check");

}

static function string GetDescriptionText(string SettingName)
{
	switch(SettingName)
	{
		//case "bSiren":
		//	return "Replaces Siren scream with a Demon Screech";
        case "bScrake":
			return "Replaces Scrake attacks with Killing Floor 2 Scrakes Voices";
        case "bFleshP":
			return "Replaces Fleshpound rage with Godzilla Scream";
		case "bPatty":
			return "Memes. Just MEMES.";
		case "bBloat":
			return "L4D2 Boomer Explosion & Idle Talking";
		default:
			return Super.GetDescriptionText(SettingName);
	}
}

defaultproperties
{
	// Mut Vars
     GroupName="KF-ZedVoiceChanger"
     FriendlyName="ZED Voice Changer Mut"
     Description="Changes some voice-lines sounds for some ZEDs - More sounds to be added soon!"
     bAlwaysRelevant=True
     RemoteRole=ROLE_SimulatedProxy

	// Bool Vars
	// bSiren=True
	bScrake=True
	bFleshP=True
	bPatty=True
	bBloat=True
}

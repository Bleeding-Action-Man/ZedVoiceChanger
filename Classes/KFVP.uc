Class KFVP extends Interaction;

const VoicePackageName="KF_VP";

struct FSoundCacheType
{
	var SoundGroup S;
	var array<Sound> L;
};
var array<FSoundCacheType> Cache;

function Initialized()
{
	local SoundGroup S;

	// Scrake - KF2 Scrake
	CacheSound(S,SoundGroup'KF_EnemiesFinalSnd.Scrake_Attack');
	S.Sounds.Length = 3;
	S.Sounds[0] = LoadSound("ScrakeAttack1");
	S.Sounds[1] = LoadSound("ScrakeAttack2");
	S.Sounds[2] = LoadSound("ScrakeAttack3");

	// FleshPound - Godzilla
	CacheSound(S,SoundGroup'KF_EnemiesFinalSnd.FP_Rage');
	S.Sounds.Length = 1;
	S.Sounds[0] = LoadSound("FP_godzilla_rage");

	// Patty
	CacheSound(S,SoundGroup'KF_EnemiesFinalSnd.Kev_Entrance');
	S.Sounds.Length = 4;
	S.Sounds[0] = LoadSound("PattyEntrance1");
	S.Sounds[1] = LoadSound("PattyEntrance2");
	S.Sounds[2] = LoadSound("PattyEntrance3");
	S.Sounds[3] = LoadSound("PattyEntrance4");
	CacheSound(S,SoundGroup'KF_EnemiesFinalSnd.Kev_Entrance_Scream');
	S.Sounds.Length = 1;
	S.Sounds[0] = LoadSound("PattyEntrance_Scream");
	
	Class'ZombieScrake'.Default.TransientSoundVolume = 2.5f;
	Class'ZombieScrake'.Default.TransientSoundRadius = 1500.f;
	Class'ZombieFleshPound'.Default.TransientSoundVolume = 2.f;
	Class'ZombieFleshPound'.Default.TransientSoundRadius = 2000.f;
}

function NotifyLevelChange()
{
	local int i;

	// Cleanup this mod and reset voices.
	for( i=0; i<Cache.Length; ++i )
		Cache[i].S.Sounds = Cache[i].L;
	Cache.Length = 0;

	Class'ZombieScrake'.Default.TransientSoundVolume = 2.f;
	Class'ZombieScrake'.Default.TransientSoundRadius = 500.f;
	Class'ZombieFleshPound'.Default.TransientSoundVolume = 1.f;
	Class'ZombieFleshPound'.Default.TransientSoundRadius = 500.f;

}

final function CacheSound( out SoundGroup S, SoundGroup In )
{
	local int i;
	
	S = In;
	i = Cache.Length;
	Cache.Length = i+1;
	Cache[i].S = S;
	Cache[i].L = S.Sounds;
}

final function CacheCopySound( SoundGroup S, SoundGroup Src )
{
	CacheSound(S,S);
	S.Sounds = Src.Sounds;
}
static final function InitializeSoundsFor( PlayerController PC )
{
	local int i;
	local KFVP C;

	if( PC==None )
		return;
	for( i=(PC.Player.LocalInteractions.Length-1); i>=0; --i )
		if( PC.Player.LocalInteractions[i].Class==Default.Class )
			return;
	C = new(None) Class'KFVP';
	C.ViewportOwner = PC.Player;
	C.Master = PC.Player.InteractionMaster;
	i = PC.Player.LocalInteractions.Length;
	PC.Player.LocalInteractions.Length = i+1;
	PC.Player.LocalInteractions[i] = C;
	C.Initialize();
}

static final function string GetVoicePackage()
{
	return VoicePackageName;
}
static final function Sound LoadSound( string N )
{
	return Sound(DynamicLoadObject(VoicePackageName$"."$N,Class'Sound'));
}

defaultproperties
{
}
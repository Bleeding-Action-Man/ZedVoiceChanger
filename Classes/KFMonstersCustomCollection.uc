// This class changes the Some of the ZED Skins to their cooler versions in other events

class KFMonstersCustomCollection extends KFMonstersCollection;

defaultproperties
{
    MonsterClasses(0)=(MClassName="KFChar.ZombieClot_STANDARD",MID="A")
	MonsterClasses(1)=(MClassName="KFChar.ZombieCrawler_STANDARD",MID="B")
	MonsterClasses(2)=(MClassName="KFChar.ZombieGoreFast_XMas",MID="C")
	MonsterClasses(3)=(MClassName="KFChar.ZombieStalker_HALLOWEEN",MID="D")
	MonsterClasses(4)=(MClassName="KFChar.ZombieScrake_STANDARD",MID="E")
	MonsterClasses(5)=(MClassName="KFChar.ZombieFleshpound_CIRCUS",MID="F")
	MonsterClasses(6)=(MClassName="KFChar.ZombieBloat_HALLOWEEN",MID="G")
	MonsterClasses(7)=(MClassName="KFChar.ZombieSiren_CIRCUS",MID="H")
	MonsterClasses(8)=(MClassName="KFChar.ZombieHusk_HALLOWEEN",MID="I")

	StandardMonsterClasses(0)=(MClassName="KFChar.ZombieClot_STANDARD",MID="A")
	StandardMonsterClasses(1)=(MClassName="KFChar.ZombieCrawler_STANDARD",MID="B")
	StandardMonsterClasses(2)=(MClassName="KFChar.ZombieGoreFast_XMas",MID="C")
	StandardMonsterClasses(3)=(MClassName="KFChar.ZombieStalker_HALLOWEEN",MID="D")
	StandardMonsterClasses(4)=(MClassName="KFChar.ZombieScrake_STANDARD",MID="E")
	StandardMonsterClasses(5)=(MClassName="KFChar.ZombieFleshpound_CIRCUS",MID="F")
	StandardMonsterClasses(6)=(MClassName="KFChar.ZombieBloat_HALLOWEEN",MID="G")
	StandardMonsterClasses(7)=(MClassName="KFChar.ZombieSiren_CIRCUS",MID="H")
	StandardMonsterClasses(8)=(MClassName="KFChar.ZombieHusk_HALLOWEEN",MID="I")


    FinalSquads(0)=(ZedClass=("KFChar.ZombieClot_STANDARD"),NumZeds=(4))
    FinalSquads(1)=(ZedClass=("KFChar.ZombieClot_STANDARD","KFChar.ZombieCrawler_STANDARD"),NumZeds=(3,1))
    FinalSquads(2)=(ZedClass=("KFChar.ZombieClot_STANDARD","KFChar.ZombieStalker_HALLOWEEN","KFChar.ZombieCrawler_STANDARD"),NumZeds=(3,1,1))

	ShortSpecialSquads(2)=(ZedClass=("KFChar.ZombieCrawler_STANDARD","KFChar.ZombieGoreFast_XMas","KFChar.ZombieStalker_HALLOWEEN","KFChar.ZombieScrake_STANDARD"),NumZeds=(2,2,1,1))
	ShortSpecialSquads(3)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieFleshpound_CIRCUS"),NumZeds=(1,2,1))

	NormalSpecialSquads(3)=(ZedClass=("KFChar.ZombieCrawler_STANDARD","KFChar.ZombieGoreFast_XMas","KFChar.ZombieStalker_HALLOWEEN","KFChar.ZombieScrake_STANDARD"),NumZeds=(2,2,1,1))
	NormalSpecialSquads(4)=(ZedClass=("KFChar.ZombieFleshpound_CIRCUS"),NumZeds=(1))
	NormalSpecialSquads(5)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieFleshpound_CIRCUS"),NumZeds=(1,1,1))
	NormalSpecialSquads(6)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieFleshpound_CIRCUS"),NumZeds=(1,1,2))

	LongSpecialSquads(4)=(ZedClass=("KFChar.ZombieCrawler_STANDARD","KFChar.ZombieGoreFast_XMas","KFChar.ZombieStalker_HALLOWEEN","KFChar.ZombieScrake_STANDARD"),NumZeds=(2,2,1,1))
	LongSpecialSquads(6)=(ZedClass=("KFChar.ZombieFleshpound_CIRCUS"),NumZeds=(1))
	LongSpecialSquads(7)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieFleshpound_CIRCUS"),NumZeds=(1,1,1))
	LongSpecialSquads(8)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieScrake_STANDARD","KFChar.ZombieFleshpound_CIRCUS"),NumZeds=(1,2,1,1))
    LongSpecialSquads(9)=(ZedClass=("KFChar.ZombieBloat_HALLOWEEN","KFChar.ZombieSiren_CIRCUS","KFChar.ZombieScrake_STANDARD","KFChar.ZombieFleshpound_CIRCUS"),NumZeds=(1,2,1,2))

    FallbackMonsterClass="KFChar.ZombieStalker_HALLOWEEN"
}

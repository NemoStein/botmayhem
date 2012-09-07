package nemostein.games.botmayhem.levels.red
{
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.arenas.RedTiledArena;
	import nemostein.games.botmayhem.assets.waves.AssetTestLevel;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.levels.Level;
	import nemostein.games.botmayhem.waves.Waves;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.BulletCannon;
	import nemostein.games.botmayhem.weaponry.weapon.WeaponsService;
	
	public class LevelRedA extends Level
	{
		private var _arena:RedTiledArena;
		private var _hero:Hero;
		private var _waves:Waves;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_arena = ArenaService.redTiledArena;
			_hero = HeroService.hero;
			
			ArenaService.currentArena = _arena;
			
			_hero.stop();
			_hero.moveWithKeys = true;
			
			add(_arena);
			
			_waves = Waves.parse(new AssetTestLevel().toString());
			_waves.startWaves(this);
			
			WeaponsService.removeAreaWeapon(_hero);
			WeaponsService.removeDirectionWeapon(_hero);
			WeaponsService.removeTargetWeaponed(_hero);
			
			WeaponsService.putDirectionWeapon(_hero, BulletCannon);
		}
		
		override protected function update():void 
		{
			_waves.updateWaves(time);
			
			super.update();
		}
	}
}
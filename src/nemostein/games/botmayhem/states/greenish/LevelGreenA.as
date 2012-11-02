package nemostein.games.botmayhem.states.greenish
{
	import nemostein.games.botmayhem.arenas.ArenaService;
	import nemostein.games.botmayhem.arenas.GreenHeightedArena;
	import nemostein.games.botmayhem.assets.waves.AssetTestLevel;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.states.Level;
	import nemostein.games.botmayhem.waves.Waves;
	import nemostein.games.botmayhem.weaponry.weapon.weapons.BulletCannon;
	import nemostein.games.botmayhem.weaponry.weapon.WeaponsService;
	
	public class LevelGreenA extends Level
	{
		private var _arena:GreenHeightedArena;
		private var _hero:Hero;
		private var _waves:Waves;
		
		override protected function initialize():void
		{
			super.initialize();
			
			_arena = ArenaService.greenHeightedArena;
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
		
		override protected function addedToGame():void
		{
			var hero:Hero = HeroService.hero;
			hero.x = bounds.x + bounds.width / 2;
			hero.y = bounds.y + bounds.height / 2;
			game.cameraLookAt(hero.x, hero.y);
			game.follow(hero);
			
			super.addedToGame();
		}
		
		override protected function update():void 
		{
			_waves.updateWaves(time);
			
			super.update();
		}
	}
}
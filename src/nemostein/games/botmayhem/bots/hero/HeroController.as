package nemostein.games.botmayhem.bots.hero
{
	import nemostein.controllers.SimpleHybridController;
	import nemostein.controllers.SimpleKeyboardController;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.io.Input;
	
	public class HeroController extends SimpleHybridController
	{
		protected var _hero:Hero;
		
		public function HeroController(input:Input, hero:Hero)
		{
			super(input, hero);
			
			_hero = hero;
		}
		
		public override function update():void
		{
			super.update();
			
			if (_input.pressed(Input.RIGHT_MOUSE))
			{
				_hero.smallShoot();
			}
			
			if (_input.pressed(Input.LEFT_MOUSE))
			{
				_hero.largeShoot();
			}
			
			if (_input.pressed(Input.SPACE))
			{
				_hero.hugeShoot();
			}
		}
	}
}
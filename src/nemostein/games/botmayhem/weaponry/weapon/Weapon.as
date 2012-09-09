package nemostein.games.botmayhem.weaponry.weapon
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.weaponry.weapon.Weapon;
	
	public class Weapon extends BulletPool
	{
		public var ready:Boolean;
		public var locked:Boolean;
		public var cooldown:Number;
		
		protected var cooldownTime:Number;
		
		public function Weapon() 
		{
			ready = true;
			cooldown = 0;
			cooldownTime = 0;
		}
		
		public function update():void 
		{
			if (!ready && !locked)
			{
				cooldownTime += Core.time;
				
				if (cooldownTime > cooldown)
				{
					cooldownTime = 0;
					ready = true;
				}
			}
		}
		
		public function shoot():void 
		{
			ready = false;
		}
	}
}
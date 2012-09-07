package nemostein.games.botmayhem.weaponry.weapon
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.games.botmayhem.weaponry.weapon.Weapon;
	
	public class BaseWeapon extends BulletPool implements Weapon
	{
		protected var weaponReady:Boolean;
		protected var weaponLocked:Boolean;
		protected var cooldownDelay:Number;
		protected var cooldownTime:Number;
		
		public function BaseWeapon() 
		{
			weaponReady = true;
			cooldownDelay = 0;
			cooldownTime = 0;
		}
		
		public function update():void 
		{
			if (!weaponReady && !weaponLocked)
			{
				cooldownTime += Core.time;
				
				if (cooldownTime > cooldownDelay)
				{
					cooldownTime = 0;
					weaponReady = true;
				}
			}
		}
		
		public function get cooldown():Number 
		{
			return cooldownDelay;
		}
		
		public function set cooldown(value:Number):void 
		{
			cooldownDelay = value;
		}
		
		public function get ready():Boolean 
		{
			return weaponReady;
		}
		
		public function set ready(value:Boolean):void 
		{
			weaponReady = value;
		}
	}
}
package nemostein.games.botmayhem.bots
{
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Entity;
	import nemostein.games.botmayhem.bots.hero.Hero;
	import nemostein.games.botmayhem.weaponry.bullet.Bullet;
	import nemostein.games.botmayhem.weaponry.DamageType;
	
	public class Bot extends Entity
	{
		public var shield:Number;
		public var maxShield:Number;
		public var shieldRegeneration:Number;
		public var shieldRegenerationDisabled:Boolean;
		public var shieldRegenerationDisableTime:Number;
		public var shieldRegenerationDisableDelay:Number;
		
		public var hull:Number;
		public var maxHull:Number;
		public var hullRegeneration:Number;
		public var hullRegenerationDisabled:Boolean;
		public var hullRegenerationDisableTime:Number;
		public var hullRegenerationDisableDelay:Number;
		
		public var maxMoveSpeed:Number;
		public var maxTurnSpeed:Number;
		
		override protected function initialize():void 
		{
			super.initialize();
			
			shield = 0;
			maxShield = 0;
			shieldRegeneration = 0;
			shieldRegenerationDisableTime = 0;
			shieldRegenerationDisableDelay = 0;
			
			hull = 1;
			maxHull = 1;
			hullRegeneration = 0;
			hullRegenerationDisableTime = 0;
			hullRegenerationDisableDelay = 0;
			
			maxMoveSpeed = 50;
			maxTurnSpeed = 1.5;
		}
		
		public function collide(angle:Number, against:Core):void
		{
			var knockback:Number = 1;
			
			if (against is Bullet)
			{
				die();
			}
			else if (against is Hero)
			{
				knockback = 3;
			}
			
			x += Math.cos(angle) * knockback;
			y += Math.sin(angle) * knockback;
		}
		
		public function hit(strenght:Number, damageType:String = DamageType.IMPACT):void
		{
			var shieldDamage:Number = 0;
			var hullDamage:Number = 0;
			
			var reducedStrenght:Number = 0;
			
			if (damageType == DamageType.IMPACT)
			{
				shieldDamage += strenght * 2;
				shieldRegenerationDisabled = true;
				
				if (shieldDamage > shield)
				{
					reducedStrenght = (shieldDamage - shield) / 2;
					
					hullDamage += reducedStrenght;
					hullRegenerationDisabled = true;
					shieldDamage = shield;
				}
			}
			else if (damageType == DamageType.FIRE)
			{
				shieldDamage += strenght * 8;
				
				if (shieldDamage > shield)
				{
					reducedStrenght = (shieldDamage - shield) / 8;
					
					hullDamage += reducedStrenght / 2;
					shieldDamage = shield;
				}
			}
			
			shield -= shieldDamage;
			hull -= hullDamage;
			
			if (hull < 0)
			{
				die();
			}
		}
		
		override protected function update():void
		{
			if(shieldRegenerationDisabled)
			{
				shieldRegenerationDisableTime += time;
				
				if (shieldRegenerationDisableTime >= shieldRegenerationDisableDelay)
				{
					shieldRegenerationDisableTime = 0;
					shieldRegenerationDisabled = false;
				}
			}
			else if (shield < maxShield)
			{
				shield += shieldRegeneration * time;
				
				if (shield > maxShield)
				{
					shield = maxShield;
				}
			}
			
			if(hullRegenerationDisabled)
			{
				hullRegenerationDisableTime += time;
				
				if (hullRegenerationDisableTime >= hullRegenerationDisableDelay)
				{
					hullRegenerationDisableTime = 0;
					hullRegenerationDisabled = false;
				}
			}
			else if (hull < maxHull)
			{
				hull += hullRegeneration * time;
				
				if (hull > maxHull)
				{
					hull = maxHull;
				}
			}
			
			super.update();
		}
	}
}
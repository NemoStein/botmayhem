package nemostein.games.botmayhem.bots.hero
{
	import flash.geom.Point;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.games.botmayhem.assets.bots.hero.AssetHeroSpritesheet;
	import nemostein.games.botmayhem.bots.Bot;
	import nemostein.games.botmayhem.weaponry.AreaWeaponed;
	import nemostein.games.botmayhem.weaponry.DirectionWeaponed;
	import nemostein.games.botmayhem.weaponry.TargetWeaponed;
	import nemostein.games.botmayhem.weaponry.weapon.AreaWeapon;
	import nemostein.games.botmayhem.weaponry.weapon.DirectionWeapon;
	import nemostein.games.botmayhem.weaponry.weapon.TargetWeapon;
	import nemostein.io.Keys;
	import nemostein.utils.MathUtils;
	
	public class Hero extends Bot implements AreaWeaponed, DirectionWeaponed, TargetWeaponed
	{
		static public const WALKING:String = "walking";
		
		private var _areaWeapon:AreaWeapon;
		private var _directionWeapon:DirectionWeapon;
		private var _targetWeapon:TargetWeapon;
		private var _lookAngle:Number;
		private var _lookAngles:Array;
		
		public var lookAtCursor:Boolean;
		public var moveWithKeys:Boolean;
		public var followTarget:Boolean;
		public var target:Point;
		
		override protected function initialize():void
		{
			target = new Point();
			
			super.initialize();
			
			//var bitmapData:BitmapData = new BitmapData(35, 30, true, 0);
			//bitmapData.fillRect(new Rectangle(0, 0, 30, 30), 0xff3b3f4f);
			//bitmapData.fillRect(new Rectangle(2, 2, 26, 26), 0xffbbbfdf);
			//bitmapData.fillRect(new Rectangle(30, 8, 15, 14), 0xff3b3f4f);
			//bitmapData.fillRect(new Rectangle(22, 10, 11, 10), 0xff9b9fbf);
			//bitmapData.fillRect(new Rectangle(14, 14, 2, 2), 0xffef4b4f);
			
			draw(new AssetHeroSpritesheet().bitmapData);
			width = 50;
			height = 70;
			
			alignAnchor(AnchorAlign.CUSTOM, AnchorAlign.CUSTOM, new Point(25, 47));
			
			addAnimation(WALKING, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 10);
			playAnimation(WALKING);
			
			_lookAngles = new Array();
			
			_lookAngles[ 0] = 0;
			_lookAngles[ 1] = 70;
			_lookAngles[ 2] = 140;
			_lookAngles[ 3] = 210;
			_lookAngles[ 4] = 280;
			_lookAngles[ 5] = 350;
			_lookAngles[ 6] = 420;
			_lookAngles[-6] = 420;
			_lookAngles[-5] = 490;
			_lookAngles[-4] = 560;
			_lookAngles[-3] = 630;
			_lookAngles[-2] = 700;
			_lookAngles[-1] = 770;
			
			maxMoveSpeed = 60;
			maxTurnSpeed = 4;
			
			maxShield = shield = 100;
			shieldRegeneration = 25;
			shieldRegenerationDisableDelay = 1;
			
			maxHull = hull = 100;
			hullRegeneration = 1;
			hullRegenerationDisableDelay = 1;
		}
		
		override protected function update():void
		{
			if (lookAtCursor)
			{
				var desiredTurn:Number = MathUtils.piWrap(Math.atan2(input.mouse.y - canvasPosition.y - anchor.y, input.mouse.x - canvasPosition.x - anchor.x) - _lookAngle);
				var turn:Number = desiredTurn;
				
				var turnSpeed:Number = maxTurnSpeed * time;
				
				if (desiredTurn > turnSpeed)
				{
					turn = turnSpeed;
				}
				else if (desiredTurn < -turnSpeed)
				{
					turn = -turnSpeed;
				}
				
				_lookAngle = MathUtils.piWrap(_lookAngle + turn);
				
				var divisor:Number = 6 / Math.PI;
				var treshold:Number = 1 / divisor / 2;
				
				frame.y = _lookAngles[Math.ceil((_lookAngle - treshold) * divisor)];
			}
			
			if (moveWithKeys)
			{
				if (input.pressed(Keys.W))
				{
					target.y = -Infinity;
				}
				else if (input.pressed(Keys.S))
				{
					target.y = Infinity;
				}
				else
				{
					target.y = y;
				}
				
				if (input.pressed(Keys.A))
				{
					target.x = -Infinity;
				}
				else if (input.pressed(Keys.D))
				{
					target.x = Infinity;
				}
				else
				{
					target.x = x;
				}
			}
			
			if (followTarget)
			{
				var distanceX:Number = target.x - x;
				var distanceY:Number = target.y - y;
				
				if (distanceX || distanceY)
				{
					var moveSpeed:Number = maxMoveSpeed * time;
					
					var moveAngle:Number = Math.atan2(distanceY, distanceX);
					
					var moveX:Number = Math.cos(moveAngle) * moveSpeed;
					var moveY:Number = Math.sin(moveAngle) * moveSpeed;
					
					if (distanceX > 0 && distanceX < moveX || distanceX < 0 && distanceX > moveX)
					{
						moveX = distanceX;
					}
					
					if (distanceY > 0 && distanceY < moveY || distanceY < 0 && distanceY > moveY)
					{
						moveY = distanceY;
					}
					
					x += moveX;
					y += moveY;
				}
			}
			
			if (_areaWeapon)
			{
				_areaWeapon.update();
			}
			
			if (_directionWeapon)
			{
				_directionWeapon.update();
			}
			
			if (_targetWeapon)
			{
				_targetWeapon.update();
			}
			
			if (input.pressed(Keys.LEFT_MOUSE))
			{
				shootDirectionWeapon();
			}
			
			if (input.pressed(Keys.RIGHT_MOUSE))
			{
				shootTargetWeapon(input.mouse);
			}
			
			if (input.pressed(Keys.SPACE))
			{
				shootAreaWeapon();
			}
			
			super.update();
		}
		
		public function stop():void
		{
			target.x = x;
			target.y = y;
		}
		
		public function shootAreaWeapon():void
		{
			if (_areaWeapon && _areaWeapon.ready)
			{
				_areaWeapon.shoot();
			}
		}
		
		public function shootDirectionWeapon():void
		{
			if (_directionWeapon && _directionWeapon.ready)
			{
				_directionWeapon.shoot();
			}
		}
		
		public function shootTargetWeapon(target:Point):void
		{
			if (_targetWeapon && _targetWeapon.ready)
			{
				_targetWeapon.target = target;
				_targetWeapon.shoot();
			}
		}
		
		public function get areaWeapon():AreaWeapon
		{
			return _areaWeapon;
		}
		
		public function set areaWeapon(value:AreaWeapon):void
		{
			_areaWeapon = value;
		}
		
		public function get directionWeapon():DirectionWeapon
		{
			return _directionWeapon;
		}
		
		public function set directionWeapon(value:DirectionWeapon):void
		{
			_directionWeapon = value;
		}
		
		public function get targetWeapon():TargetWeapon
		{
			return _targetWeapon;
		}
		
		public function set targetWeapon(value:TargetWeapon):void
		{
			_targetWeapon = value;
		}
		
		override public function get angle():Number 
		{
			return _lookAngle;
		}
		
		override public function set angle(value:Number):void 
		{
			_lookAngle = value;
		}
	}
}
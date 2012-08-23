package nemostein.games.botmayhem.bots.hero
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
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
		private var _areaWeapon:AreaWeapon;
		private var _directionWeapon:DirectionWeapon;
		private var _targetWeapon:TargetWeapon;
		
		public var target:Point;
		public var lookAtCursor:Boolean;
		public var moveWithKeys:Boolean;
		public var followTarget:Boolean;
		
		override protected function initialize():void
		{
			target = new Point();
			
			frame.width = 35;
			frame.height = 30;
			
			sprite = new BitmapData(frame.width, frame.height, true, 0);
			sprite.fillRect(new Rectangle(0, 0, 30, 30), 0xff3b3f4f);
			sprite.fillRect(new Rectangle(2, 2, 26, 26), 0xffbbbfdf);
			sprite.fillRect(new Rectangle(30, 8, 15, 14), 0xff3b3f4f);
			sprite.fillRect(new Rectangle(22, 10, 11, 10), 0xff9b9fbf);
			
			super.initialize();
		}
		
		override protected function update():void
		{
			if (lookAtCursor)
			{
				var desiredTurn:Number = MathUtils.piWrap(Math.atan2(input.mouse.y - y, input.mouse.x - x) - angle);
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
				
				angle += turn;
			}
			
			var moveSpeed:Number = maxMoveSpeed * time;
			
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
				
				var moveX:Number = distanceX;
				var moveY:Number = distanceY;
				
				var moveAngle:Number = Math.atan2(distanceY, distanceX);
				
				if (distanceX > moveSpeed || distanceX < -moveSpeed)
				{
					moveX = Math.cos(moveAngle) * moveSpeed;
				}
				
				if (distanceY > moveSpeed || distanceY < -moveSpeed)
				{
					moveY = Math.sin(moveAngle) * moveSpeed;
				}
				
				x += moveX;
				y += moveY;
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
			if (_areaWeapon)
			{
				_areaWeapon.shoot();
			}
		}
		
		public function shootDirectionWeapon():void
		{
			if (_directionWeapon)
			{
				_directionWeapon.shoot(angle);
			}
		}
		
		public function shootTargetWeapon(target:Point):void
		{
			if (_targetWeapon)
			{
				_targetWeapon.shoot(target);
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
	}
}
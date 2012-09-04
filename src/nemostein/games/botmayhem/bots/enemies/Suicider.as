package nemostein.games.botmayhem.bots.enemies
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.utils.MathUtils;
	
	public class Suicider extends Enemy
	{
		private var moveAngle:Number;
		
		override protected function initialize():void
		{
			super.initialize();
		
			frame.width = 35;
			frame.height = 30;
			
			sprite = new BitmapData(frame.width, frame.height, true, 0);
			sprite.fillRect(new Rectangle(0, 0, 30, 30), 0xff4f3b3f);
			sprite.fillRect(new Rectangle(2, 2, 26, 26), 0xffdfbbbf);
			sprite.fillRect(new Rectangle(30, 8, 15, 14), 0xff4f3b3f);
			sprite.fillRect(new Rectangle(22, 10, 11, 10), 0xffbf9b9f);
			sprite.fillRect(new Rectangle(14, 14, 2, 2), 0xff4f4bef);
			
			alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
			
			moveAngle = 0;
		}
		
		override protected function update():void
		{
			var distanceX:Number = hero.x - x;
			var distanceY:Number = hero.y - y;
			
			if (distanceX || distanceY)
			
			//{
				//var moveSpeed:Number = maxMoveSpeed * time;
				//
				//var desiredMoveAngle:Number = Math.atan2(distanceY, distanceX);
				//var moveAngleDifference:Number = MathUtils.piWrap(desiredMoveAngle - moveAngle);
				//
				//_motionAngle += _angleDifference * _turnSpeed * _frameTime;
				//
				//var moveX:Number = Math.cos(moveAngle) * moveSpeed;
				//var moveY:Number = Math.sin(moveAngle) * moveSpeed;
				//
				//if (distanceX > 0 && distanceX < moveX || distanceX < 0 && distanceX > moveX)
				//{
					//moveX = distanceX;
				//}
				//
				//if (distanceY > 0 && distanceY < moveY || distanceY < 0 && distanceY > moveY)
				//{
					//moveY = distanceY;
				//}
				//
				//x += moveX;
				//y += moveY;
				//
				//angle = Math.atan2(moveY, moveX);
			//}
			
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
				
				angle = Math.atan2(moveY, moveX);
			}
			
			super.update();
		}
	}
}
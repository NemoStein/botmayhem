package nemostein.games.botmayhem.bots.enemies
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.utils.MathUtils;
	
	public class Suicider extends Enemy
	{
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
			
			maxMoveSpeed *= Math.random() * 0.25 + 0.875;
			maxTurnSpeed *= Math.random() * 0.25 + 0.875;
		}
		
		override protected function update():void
		{
			var distanceX:Number = hero.x - x;
			var distanceY:Number = hero.y - y;
			
			if (distanceX || distanceY)
			{
				var turnSpeed:Number = maxTurnSpeed * time;
				var moveSpeed:Number = maxMoveSpeed * time;
				
				var desiredAngle:Number = Math.atan2(distanceY, distanceX);
				var angleDifference:Number = MathUtils.piWrap(desiredAngle - angle);
				
				angle += angleDifference * turnSpeed;
				
				x += Math.cos(angle) * moveSpeed;
				y += Math.sin(angle) * moveSpeed;
			}
			
			super.update();
		}
	}
}
package nemostein.games.botmayhem.core
{
	import com.coreyoneil.collision.CollisionGroup;
	import com.coreyoneil.collision.CollisionList;
	import com.troygilbert.CollisionUtils;
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import nemostein.controllers.Collidable;
	import nemostein.controllers.Collider;
	import nemostein.controllers.SimpleCollider;
	
	public class PixelPerfectCollider extends SimpleCollider
	{
		override public function isColliding(collidableA:Collidable, collidableB:Collidable):Boolean
		{
			if (collidableA == collidableB)
			{
				return true;
			}
			
			if(!(collidableA is DisplayObject && collidableB is DisplayObject))
			{
				throw new ArgumentError("collidableA and collidableB must extends DisplayObject for PixelPerfect Collisions");
			}
			
			var a:DisplayObject = DisplayObject(collidableA);
			var b:DisplayObject = DisplayObject(collidableB);
			
			if (a.parent)
			{
				var collisionRect:Rectangle = CollisionUtils.getCollisionRect(a, b, a.parent, true);
				
				return collisionRect.width && collisionRect.height;
			}
			
			return false;
		}
	}
}
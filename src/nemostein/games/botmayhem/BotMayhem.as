package nemostein.games.botmayhem
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import nemostein.framework.dragonfly.AnchorAlign;
	import nemostein.framework.dragonfly.Core;
	import nemostein.framework.dragonfly.Game;
	import nemostein.games.botmayhem.bots.hero.HeroService;
	import nemostein.games.botmayhem.core.SystemService;
	import nemostein.games.botmayhem.levels.Level;
	
	public class BotMayhem extends Game
	{
		private var coreA:Core;
		private var coreB:Core;
		private var hint:Core;
		
		public function BotMayhem()
		{
			super(900, 600);
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			HeroService.buildHero(830, -25, -Math.PI / 2);
			
			SystemService.registerGame(this);
			SystemService.changeLevel(Level.MENU);
			
			/**
			
			var bitmapDataA:BitmapData = new BitmapData(50, 50, true, 0x8000ff00);
			bitmapDataA.fillRect(new Rectangle(40, 20, 10, 10), 0xff008000);
			coreA = new Core(bitmapDataA);
			
			var bitmapDataB:BitmapData = new BitmapData(50, 50, true, 0x800000ff);
			bitmapDataB.fillRect(new Rectangle(40, 20, 10, 10), 0xff000080);
			coreB = new Core(bitmapDataB);
			
			add(coreA);
			add(coreB);
			
			coreA.y = 100;
			coreB.y = 130;
			
			coreA.x = 350;
			coreB.x = 450;
			
			//coreA.alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
			//coreB.alignAnchor(AnchorAlign.CENTER, AnchorAlign.CENTER);
			
			hint = new Core();
			add(hint);
		}
		
		override protected function update():void 
		{
			coreA.x += 0.5;
			coreB.x -= 0.5;
			coreB.y -= 0.5;
			
			coreA.angle -= 0.01;
			coreB.angle += 0.01;
			
			if (coreA.isColliding(coreB))
			{
				hint.revive();
				
				var aTop:Number = coreA.canvasPosition.y;
				var aLeft:Number = coreA.canvasPosition.x;
				var aBottom:Number = aTop + coreA.height;
				var aRight:Number = aLeft + coreA.width;
				
				var bTop:Number = coreB.canvasPosition.y;
				var bLeft:Number = coreB.canvasPosition.x;
				var bBottom:Number = bTop + coreB.height;
				var bRight:Number = bLeft + coreB.width;
				
				var hintWidth:Number;
				var hintHeight:Number;
				
				if(aLeft < bLeft)
				{
					hintWidth = aRight - bLeft;
				}
				else
				{
					hintWidth = bRight - aLeft;
				}
				
				if(aTop < bTop)
				{
					hintHeight = aBottom - bTop;
				}
				else
				{
					hintHeight = bBottom - aTop;
				}
				
				if(hintWidth && hintHeight)
				{
					hint.draw(new BitmapData(hintWidth, hintHeight, true, 0x80ff0000));
					
					if(aLeft < bLeft)
					{
						hint.x = bLeft;
					}
					else
					{
						hint.x = aLeft;
					}
					
					if(aTop < bTop)
					{
						hint.y = bTop;
					}
					else
					{
						hint.y = aTop;
					}
				}
			}
			else
			{
				hint.die();
			}
			
			super.update();
			
			/**/
		}
		
		// DELETE: Particle test
		//override protected function update():void
		//{
			//if (input.justPressed(Keys.LEFT_MOUSE))
			//{
				//var particleTest:Particles = new Particles(this);
			//}
			//
			//super.update();
		//}
	}
}
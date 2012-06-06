package com.mythgames.breakout 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author MC
	 */
	public class Ball extends Sprite 
	{
		public var speedX:int = 7;
		public var speedY:int = 4;

		
		
		[Embed(source = "../../../../assets/sprites/Ball.png")]
		private var ballSprite:Class;
		
		public function Ball():void 
		{
			var ball:Bitmap = new ballSprite();
			this.addChild(ball);
		}
		
		
		public function updateBall():void
		{
			this.x += speedX;
			this.y += speedY;
			
		// 	Ball hitting the right wall (- 15 is  to avoid border white lines)
			if (this.x > stage.stageWidth-this.width)
			{

				this.x = stage.stageWidth - this.width;
				speedX *= -1;
		
			}
			
		// Ball hitting the left wall (- 5 is  to avoid border white lines)
			else if (this.x < 0)
			{

				this.x = 0 ;
				speedX *= -1;

			}
			
		// Ball hitting the top wall (- 5 is  to avoid border white lines)
			else if (this.y <this.height  )
			{
				this.y = this.height ;
				speedY *= -1;
	
			}
		
		// Ball hitting the bottom wall (- 15 is  to avoid border white lines)
			else if (this.y > stage.stageHeight-this.height)
			{
			//	this.y = stage.stageHeight - this.height ;
			//	speedY *= -1;
				Game.gameOver = true;
			}
		}
		

		
	}

}
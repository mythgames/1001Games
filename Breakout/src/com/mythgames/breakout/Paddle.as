package com.mythgames.breakout 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author MC
	 */
	public class Paddle extends Sprite 
	{
		[Embed(source='../../../../assets/sprites/Paddle.png')]
		private var Pad:Class;
		
		public function Paddle():void 
		{
			var paddle:Bitmap = new Pad();
			this.addChild(paddle);
			this.y = 450;
		}
		
		
		public function onMove():void 
		{
			this.x = stage.mouseX;
			
		/*	if (this.y < stage.stageWidth-110)
			{
				this.y=stage.stageWidth-110;
			}
			else if (this.y > 460-this.height)
			{
				this.y = 460-this.height;
			}*/
		}
		
		
	}

}
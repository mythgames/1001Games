package com.mythgames.breakout 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author MC
	 */
	public class Brick extends Sprite
	{
		[Embed(source = "../../../../assets/sprites/Brick.png")]
		private var brickSprite:Class;
		
		
		public function Brick() 
		{
			var brick:Bitmap = new brickSprite();
			this.addChild(brick);
		}
		
	}

}
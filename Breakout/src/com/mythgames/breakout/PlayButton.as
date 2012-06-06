package com.mythgames.breakout 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author MC
	 */
	public class PlayButton extends Sprite
	{
		[Embed(source = "../../../../assets/sprites/Play.png")]
		private var PlayClick:Class;
		
		public function PlayButton() 
		{
			var playButton:Bitmap = new PlayClick();
			this.addChild(playButton);
		}
		
	}

}
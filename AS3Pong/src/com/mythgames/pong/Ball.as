
/****************************************************************************************************/
/*                       GAME TITLE: PONG															*/
/*						GAME NUMBER: 0001															*/
/*                         LANGUAGE: ACTIONSCRIPT3 (AS3)											*/
/****************************************************************************************************/
/*                            CLASS: Ball.as														*/
/*   			 	The BALL that moves across the screen/Game area									*/
/*                            																		*/
/****************************************************************************************************/


package com.mythgames.pong
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.net.URLRequest;
	import flash.media.Sound;
	

	public class Ball extends Sprite 
	{
		public var speedX:int = 7;
		public var speedY:int = 4;
		public var score_A:int = 0;
		public var score_B:int = 0;
		
		[Embed(source='../../../../assets/sprites/Ball.png')]
		private var Temp:Class;
		[Embed(source = "../../../../assets/audio/Offwall.mp3")]
		private var wallSound:Class;
		private var sound:Sound;
		
		
//----------------------------------------------------------------------------------------------
//		CONSTRUCTOR
//----------------------------------------------------------------------------------------------
		public function Ball()
		{
			
			sound = new wallSound();
			x = 400;
			y = 240;
			var ball:Bitmap = new Temp();
			this.addChild(ball);
		}
		
//----------------------------------------------------------------------------------------------
//								METHODS DEFINITION(functions)
//----------------------------------------------------------------------------------------------

		public function updateBall():void
		{
			this.x += speedX;
			this.y += speedY;
			
		// 	Ball hitting the right wall (- 15 is  to avoid border white lines)
			if (this.x > stage.stageWidth-this.width-15)
			{
				score_A++;
				this.x = stage.stageWidth - this.width - 15;
				speedX *= -1;
				sound.play();
			}
			
		// Ball hitting the left wall (- 5 is  to avoid border white lines)
			else if (this.x < this.width-5)
			{
				score_B++;
				this.x = this.width - 5;
				speedX *= -1;
				sound.play();
			}
			
		// Ball hitting the top wall (- 5 is  to avoid border white lines)
			else if (this.y <this.height - 5 )
			{
				this.y = this.height - 5;
				speedY *= -1;
			//	sound.play();
			}
		
		// Ball hitting the bottom wall (- 15 is  to avoid border white lines)
			else if (this.y > stage.stageHeight-this.height-15)
			{
				this.y = stage.stageHeight - this.height - 15;
				speedY *= -1;
			//	sound.play();
			}
		}
			
	
	}

}
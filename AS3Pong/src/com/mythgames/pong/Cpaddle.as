
/****************************************************************************************************/
/*                       GAME TITLE: PONG															*/
/*						GAME NUMBER: 0001															*/
/*                         LANGUAGE: ACTIONSCRIPT3 (AS3)											*/
/****************************************************************************************************/
/*                            CLASS: Cpaddle.as														*/
/*  			The OPPONENT player paddle controlled by the computer AI							*/
/*  	 The game complexity can be changed by varying the variable:cpuPaddleSpeed 			     	*/
/*                            																		*/
/****************************************************************************************************/


package com.mythgames.pong
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Bitmap;

	public class Cpaddle extends Sprite
	{
		public var cpuPaddleSpeed:int = 3;
		
		[Embed(source='../../../../assets/sprites/Paddle.png')]
		private var Paddle:Class;
		
		
//----------------------------------------------------------------------------------------------
//										CONSTRUCTOR
//----------------------------------------------------------------------------------------------
		public function Cpaddle()
		{
			var paddle:Bitmap = new Paddle();
			this.addChild(paddle);
			this.x = 760;
		}
		
//----------------------------------------------------------------------------------------------
//								METHODS DEFINITION(functions)
//----------------------------------------------------------------------------------------------
		public function onMove():void 
		{
			if (this.y < 20)
			{
				this.y=20;
			}
			else if (this.y > 460-this.height)
			{
				this.y = 460-this.height;
			}
		}
		
		
		public function AIpaddle(ball:Sprite):void
		{
			if (this.y < ball.y - 10)
			{
				this.y += this.cpuPaddleSpeed;
			} 
			else if (this.y > ball.y + 10)
			{
				this.y -= this.cpuPaddleSpeed;
			}
		}
	
		
	}
	
	


}
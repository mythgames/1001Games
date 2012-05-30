
/****************************************************************************************************/
/*                       GAME TITLE: PONG															*/
/*						GAME NUMBER: 0001															*/
/*                         LANGUAGE: ACTIONSCRIPT3 (AS3)											*/
/****************************************************************************************************/
/*                            CLASS: Ppaddle.as														*/
/*  			The  PLAYER paddle controlled by the movement of the mouse							*/
/*                            																		*/
/****************************************************************************************************/


package com.mythgames.pong
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Bitmap;
	

	public class Ppaddle extends Sprite
	{
		[Embed(source='../../../../assets/sprites/Paddle.png')]
		private var Paddle:Class;
		
		
//----------------------------------------------------------------------------------------------
//									CONSTRUCTOR
//----------------------------------------------------------------------------------------------
		public function Ppaddle()
		{
			
			var paddle:Bitmap = new Paddle();
			this.addChild(paddle);
			this.x = 25;
		}
		
//----------------------------------------------------------------------------------------------
//							METHODS DEFINITION(functions)
//----------------------------------------------------------------------------------------------
		public function onMove():void 
		{
			this.y = stage.mouseY;
			
			if (this.y < 20)
			{
				this.y=20;
			}
			else if (this.y > 460-this.height)
			{
				this.y = 460-this.height;
			}
		}
			
		
		
	}
	
	


}
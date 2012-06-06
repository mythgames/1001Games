package com.mythgames.breakout 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author MC
	 */
	public class Game extends MovieClip
	{
		private var paddle:Paddle;
		private var ball:Ball;
		private var bricks:Array;
		private const ballRadius:Number = 9;
		private const paddleWidth:Number = 90;
		private const paddleHeight:Number = 18;
		
		public static var gameOver:Boolean = false;
		
		public function Game():void 
		{
			paddle = new Paddle();
			addChild(paddle);
			ball = new Ball();
			addChild(ball);
			ball.x = 240;
			ball.y = 300;
			
			layBricks();
						
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		private function layBricks():void 
		{
			bricks = new Array();
			
			// create a grid of bricks, 5 vertical by 8 horizontal
			for(var y:uint=0;y<5;y++) {
				for(var x:uint=0;x<13;x++) {
					var newBrick:Brick = new Brick();
					// space them nicely
					newBrick.x = 60*x+10;
					newBrick.y = 35*y+20;
					addChild(newBrick);
					bricks.push(newBrick);
				}
			}
		}
		
		private function gameLoop(e:Event):void 
		{
			paddle.onMove();
			ball.updateBall();
			testCollisions();
		}
		
		private function testCollisions():void 
		{
			//collision between ball and paddle
			if (ball.hitTestObject(paddle))
			{
				ball.speedY *= -1;
			}
			
			
			
			// collision between ball and bricks
			for (var i:int = bricks.length - 1; i > 0; i--)
			{
				if (ball.hitTestObject(bricks[i]))
				{
					//ball.speedX *= -1;
					ball.speedY *= -1;
					
					// remove the brick
					removeChild(bricks[i]);
					bricks.splice(i,1);
				}
				
				if (bricks.length < 1) 
				{
						gameOver = true;
				}

			}
			
			if (gameOver)
			{
				endGame();
			}
			
			
			
			
		}
		
		public function endGame():void 
		{
			removeEventListener(Event.ENTER_FRAME, gameLoop);
			dispatchEvent(new Event("gameOver"));
			gameOver = false;
		}
		
		
		
	}

}
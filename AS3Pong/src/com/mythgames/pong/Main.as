
/****************************************************************************************************/
/*                       GAME TITLE: PONG															*/
/* 						 START DATE: Thursday,May 17th,2012											*/
/* 						   END DATE: Monday, May 28th,2012											*/
/*						GAME NUMBER: 0001															*/
/*                         LANGUAGE: ACTIONSCRIPT3 (AS3)											*/
/****************************************************************************************************/
/*                            CLASS: MAIN.as														*/
/*  This is the main class where all the game objects are added and most of the   					*/
/*              collission detection and score updating is done                                   	*/
/*                            																		*/
/****************************************************************************************************/


package com.mythgames.pong
{

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.net.URLRequest;
	import flash.media.Sound;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	

	public class Main extends Sprite 
	{

		[Embed(source='../../../../assets/sprites/Court.png')]
		private var Field:Class;
		
		[Embed(source='../../../../assets/sprites/Won.png')]
		private var Won:Class;
		
		[Embed(source='../../../../assets/sprites/Lost.png')]
		private var Lost:Class;
		
		[Embed(source='../../../../assets/sprites/Play.png')]
		private var playButton:Class;
		
		[Embed(source='../../../../assets/sprites/Playagain.png')]
		private var playAgain:Class;
		
		[Embed(	source = '../../../../assets/Font/Mecha_Bold.ttf',
				fontWeight = 'normal',
				mimeType = 'application/x-font',
				fontName = 'Mecha_Bold',
				advancedAntiAliasing = 'true',
				embedAsCFF = 'false')]
		private var Mechafont:Class;
		
		[Embed(source = "../../../../assets/audio/Tennis.mp3")]
		private var playerSound:Class;
		private var sound:Sound;
		
		private var ball:Ball;
		private var player:Ppaddle;
		private var opponent:Cpaddle;
		private var scoreA:int = 0;
		private var scoreB:int = 0;
		private var scoreWin:int = 10;
		private var textA:TextField = new TextField();
		private var textB:TextField = new TextField();
		private var restart:TextField = new TextField();
		
		
//----------------------------------------------------------------------------------------------
//										CONSTRUCTOR
//----------------------------------------------------------------------------------------------
		public function Main()
		{
			init(); // Initialize Game Objects
		//	addEventListener(Event.ENTER_FRAME, gameLoop);		// ADD GAMELOOP 
			stage.addEventListener(MouseEvent.CLICK, restartGame);
			

		}
		
//----------------------------------------------------------------------------------------------
//								METHODS DEFINITION(functions)
//----------------------------------------------------------------------------------------------

		// Initialize a new game
		private function init():void 
		{
			sound = new playerSound();
			
			// Add a Background	(Court.png )
			var field:Bitmap = new Field();
			addChild(field);
			
			// SCORE text fields
			var myFont:Font = new Mechafont();

			var myFormat:TextFormat = new TextFormat();
			myFormat.size = 140;
			myFormat.align = TextFormatAlign.CENTER;
			myFormat.font = "Mecha_Bold";
			
			
			
			textA.defaultTextFormat = myFormat;
			textA.selectable = false;
			textA.embedFonts = true;
			textA.textColor = 0xFFFFFF;
			textA.height = 150;
			textA.width = 200;
			addChild(textA);
			textA.x = stage.stageWidth / 4;

			textB.defaultTextFormat = myFormat;
			textB.selectable = false;
			textB.embedFonts = true;
			textB.textColor = 0xFFFFFF;
			textB.height = 150;
			textB.width = 200;
			addChild(textB);
			textB.x = stage.stageWidth / 2;		
			
			restart.defaultTextFormat = myFormat;
			restart.selectable = false;
			restart.embedFonts = true;
			restart.textColor = 0xFFFFFF;
			restart.height = 150;
			restart.width = 650;
			addChild(restart);
			restart.x =100;
			restart.y = stage.stageHeight-restart.height;
			restart.text = "CLICK TO PLAY"
			
		
			// Add a ball instance onto the stage
			ball= new Ball();
			addChild(ball);
		
			// Add player paddle
			player = new Ppaddle();
			addChild(player);
			
			// Add CPU paddle
			opponent = new Cpaddle();
			addChild(opponent);
		
			
			
		}
		
		// checking for the playerLost condition
		private function playerLost():void 
		{
			removeEventListener(Event.ENTER_FRAME, gameLoop);
			var lost : Bitmap = new Lost();
			addChild(lost);
			addChild(restart);
			lost.x = stage.stageWidth / 2 - lost.width/2;
			lost.y = stage.stageHeight / 2 - lost.height / 2;
			stage.addEventListener(MouseEvent.CLICK, restartGame);
		}
		
		// checking for playerwon condition
		private function playerWon():void 
		{
			removeEventListener(Event.ENTER_FRAME, gameLoop);
			var won:Bitmap = new Won();
			addChild(won);
			addChild(restart);
			won.x = stage.stageWidth / 2 - won.width/2;
			won.y = stage.stageHeight / 2 - won.height / 2;
			stage.addEventListener(MouseEvent.CLICK, restartGame);
			
		}
			
//----------------------------------------------------------------------------------------------
//										EVENT HANDLERS
//----------------------------------------------------------------------------------------------
		
		// The main Game Loop
		private function gameLoop(e:Event):void 
		{
			restart.visible = false;
			// Score updates
			scoreA = ball.score_A;
			textA.text =""+String(scoreA);
			scoreB = ball.score_B;
			textB.text =""+String(scoreB);
		
			// Check for winning condition
			if (scoreA > scoreWin)
			{
				playerWon();
			}
			else if (scoreB > scoreWin)
			{
				playerLost();
			}
			
			
		//	trace("A:" + scoreA + " B:" + scoreB);
			
			// Make the ball move
			ball.updateBall();
			
			player.onMove();
			opponent.onMove();
			
			// Move (AI) the CPU paddle	
			opponent.AIpaddle(ball); // pass the ball instance for (it's position)reference in the Cpaddle Class
		
			// Test for collision between the player/CPU paddles and the ball
			if ((player.hitTestObject(ball))||(opponent.hitTestObject(ball)))
			{
				ball.speedX *= -1;
				sound.play();
			}
		
		}
		
		
				
		private function restartGame(e:MouseEvent):void 
		{
			removeChild(restart);
			stage.removeEventListener(MouseEvent.CLICK, restartGame);
			init(); // Initialize Game Objects
			addEventListener(Event.ENTER_FRAME, gameLoop);		// ADD GAMELOOP 
		}
		
		
	}
	
	


}
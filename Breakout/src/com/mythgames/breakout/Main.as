package com.mythgames.breakout
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author MC
	 */
	
	 
	public class Main extends Sprite 
	{
		public static var STATE_LOGO:String = "logo";
		public static var STATE_MAINMENU:String = "mainmenu";
		public static var STATE_HELPMENU:String = "helpmenu";
		public static var STATE_CREDITSMENU:String = "creditsmenu";
		public static var STATE_STARTGAME:String = "startgame";
		public static var STATE_PLAYGAME:String = "playgame";
		
		public static var currentState:String;
		
		[Embed(source = "../../../../assets/sprites/Background.png")]
		private var Background:Class;
		
		private var playButton:PlayButton;
		
		private var game:Game;
		
		
		public function Main():void 
		{
			var background:Bitmap = new Background();
			addChild(background);
			startTheEvents();
			currentState = STATE_LOGO;
		}
		
				
		private function stopTheEvents():void 
		{
			removeEventListener(Event.ENTER_FRAME, mainLoop);
		}
		
		private function startTheEvents():void
		{
			addEventListener(Event.ENTER_FRAME, mainLoop);
		}
		
		
		
		
		private function mainLoop(e:Event):void 
		{
			switch(currentState)
			{
				case STATE_LOGO:
					showLogo();
					break;
					
				case STATE_MAINMENU:
					showMainMenu();
					break;
					
				case STATE_HELPMENU:
					showHelpMenu();
					break;
					
				case STATE_CREDITSMENU:
					showCreditsMenu();
					break;
					
				case STATE_STARTGAME:
					setToStartGame();
					break;
					
				case STATE_PLAYGAME:
					startTheGame();
					break;
			}
			
		}
		
		private function showLogo():void 
		{
			stopTheEvents();
			trace("Here comes your logo");
			currentState = STATE_MAINMENU;
			startTheEvents();
		}

		
		private function showMainMenu():void 
		{
			stopTheEvents();
			playButton = new PlayButton();
			playButton.x = stage.stageWidth / 2 - playButton.width / 2;
			playButton.y = stage.stageHeight / 2 - playButton.height / 2;
			addChild(playButton);
			playButton.addEventListener(MouseEvent.CLICK, playClicked);
			trace("Here comes your main menu");
		}
		
		private function playClicked(e:MouseEvent):void 
		{
			trace("Play button clicked");
			playButton.removeEventListener(MouseEvent.CLICK, playClicked);
			removeChild(playButton);
			
			currentState = STATE_PLAYGAME;
			startTheEvents();
		}
		
		private function showHelpMenu():void 
		{
			
		}
		
		private function showCreditsMenu():void 
		{
			
		}
		
		private function setToStartGame():void 
		{
			
		}
		
		private function startTheGame():void 
		{
			stopTheEvents();
			game = new Game();
			addChild(game);
			game.addEventListener("gameOver", onGameOver);
			trace("game started");
		}
		
		private function onGameOver(e:Event):void 
		{
			game.removeEventListener("gameOver", onGameOver);
			removeChild(game);
			addEventListener(Event.ENTER_FRAME,mainLoop);
			currentState = STATE_MAINMENU;
		}
		
		
		
	}
	
}
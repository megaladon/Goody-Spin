package 
{
	import com.game.Game;
	import com.game.data.SlotDataEvents;
	import com.game.GameEvents;
	import com.greensock.easing.Linear;
	import com.greensock.TweenMax;
	import com.interfaceScreens.mainMenu.MainMenu;
	import com.interfaceScreens.mainMenu.MainMenuEvents;
	import com.intro.Intro;
	import com.intro.IntroEvents;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.System;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class Main extends Sprite 
	{
		//static public const SCREEN_WIDTH:int = 1024;
		//static public const SCREEN_HEIGHT:int = 768;
		//static public const OFF_SCREEN_LEFT:Number = 0
		//static public const OFF_SCREEN_RIGHT:Number = SCREEN_WIDTH
		//
		//static public const SOUND_MANAGER:SoundManager = new SoundManager();
		
		private var _mainMenu:MainMenu;
		//private var _game:Game;
		private var _mainLayer:MovieClip;
		private var _introLayer:MovieClip;
		
		// debug vars
		private var _debugLayer:MovieClip;
		private var _debugTextField:TextField;
		
		//private var _hud:Hud;
		private var _intro:Intro;
		private var _game:Game;
		//private var _tm:TransitionManager;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// --- Init layers ---
			_mainLayer 	= new MovieClip();
			_introLayer	= new MovieClip();
			_debugLayer = new MovieClip();
			
			addChild(_mainLayer);
			addChild(_introLayer);
			addChild(_debugLayer);			
			
			// --- Init Intro -- 
			_intro = new Intro();
			_introLayer.addChild(_intro);
			_intro.addEventListener(IntroEvents.INTRO_DONE, introDone);
			
			// --- Init main menu ---
			initMainMenu();
			
			//SOUND_MANAGER = new SoundManager();
			
			// --- Init debug loop ---
			//_debugTextField = new TextField();
			//// set the text format before setting the text property
			//var myFormat:TextFormat = new TextFormat()
			//myFormat.size  = 25 
			//myFormat.color = "0xff0000"
			//myFormat.bold  = true
			//myFormat.font  = "Arial"
			//_debugTextField.defaultTextFormat = myFormat	
			//_debugTextField.x = 200;
			//_debugTextField.y = 0;
			//_debugTextField.width = 300
			//_debugTextField.autoSize = TextFieldAutoSize.CENTER;
			//_debugLayer.addChild(_debugTextField);
			//
			//var dropShadow:DropShadowFilter =  new DropShadowFilter();    
			//_debugTextField.filters =  new Array(dropShadow);
			//
			//addEventListener(Event.ENTER_FRAME, debugLoop);
		}
		
		private function introDone(e:IntroEvents):void 
		{
			TweenMax.to( _intro, 1, { alpha: 0, delay: 1, ease:Linear.easeNone, onComplete: removeIntro } );
		}
		
		private function removeIntro():void 
		{			
			_introLayer.removeChild(_intro);
		}
		
		private function debugLoop(e:Event):void 
		{
			var kb:Number = System.totalMemory / 1024;
			var mb:Number = kb / 1024;
			var txt:String = "kb: " + Math.round(kb) + " mb: " + Math.round(mb);
			_debugTextField.text = txt;
		}
		
		private function initMainMenu():void 
		{
			_mainMenu 	= new MainMenu();
			_mainMenu.addEventListener(MainMenuEvents.PLAY_BUTTON_CLICKED, handlePlayClicked);
			_mainLayer.addChild(_mainMenu);
		}
		
		private function handlePlayClicked(e:Event):void 
		{
			
			_mainMenu.removeEventListener(MainMenuEvents.PLAY_BUTTON_CLICKED, handlePlayClicked);
			_mainLayer.removeChild(_mainMenu);
			_game = new Game( _mainMenu.selectedDataSet );
			_game.addEventListener(GameEvents.BACK_BUTTON_CLICKED, handleBackClicked);
			_mainLayer.addChild(_game);
		}
		
		private function handleBackClicked(e:GameEvents):void 
		{
			_mainLayer.removeChild(_game);
			_game = null;
			initMainMenu();
		}
		
	}
	
}
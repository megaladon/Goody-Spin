package com.interfaceScreens.mainMenu 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class MainMenu extends MovieClip 
	{
		private var _clip:MainMenu_MC;
		private var _playButton:MovieClip;
		private var _optionsButton:MovieClip;
		private var _selectedDataSet:String;
		
		public function MainMenu() 
		{
			_clip = new MainMenu_MC();
			addChild(_clip);
			init();
		}
		
		private function init():void 
		{
			_playButton = _clip.play_btn;
			
			var _buttons:Array = [_clip.abcs, _clip.numbers, _clip.animals, _clip.vehicals, _clip.shapes];
			
			for (var i:int = 0; i < _buttons.length; i++) 
			{
				_buttons[i].buttonMode = true;
				_buttons[i].mouseChildren = false;
				_buttons[i].addEventListener(MouseEvent.MOUSE_UP, onButtonClicked);
				_buttons[i].addEventListener(MouseEvent.MOUSE_DOWN, onHiliteButton);
			}
			
			
			
			
			
			
		}
		
		private function onHiliteButton(e:MouseEvent):void 
		{		
			//Main.hiliteClip(_playButton);
		}
		
		public function cleanUp():void 
		{
			_playButton.removeEventListener(MouseEvent.CLICK, onButtonClicked);			
			removeChild( _clip );
			_clip = null;
		}
		
		private function onButtonClicked(e:MouseEvent):void 
		{
			trace("onButtonClicked" +e.target + " " + e.target.name);
			_selectedDataSet = e.target.name
			//Main.unHiliteClip(_playButton);
			dispatchEvent( new MainMenuEvents(MainMenuEvents.PLAY_BUTTON_CLICKED) );
		}
		
		public function get selectedDataSet():String 
		{
			return _selectedDataSet;
		}
		
	}

}
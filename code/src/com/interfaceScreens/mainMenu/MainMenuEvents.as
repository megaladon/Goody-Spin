package com.interfaceScreens.mainMenu 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class MainMenuEvents extends Event 
	{
		public static const PLAY_BUTTON_CLICKED:String = "playButtonClicked";
		
		public function MainMenuEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new MainMenuEvents(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("MainMenuEvewnts", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}
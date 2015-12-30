package com.game 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class GameEvents extends Event 
	{
		public static const WAITING_FOR_USER:String 	= 	"waitingForUser";
		public static const SPINNING:String 			=	"spinning";
		public static const SHOWING_ANIMATION:String	= 	"showingAnimation";
		public static const BACK_BUTTON_CLICKED:String	= 	"blackButtonClicked";
		
		
		public function GameEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new GameEvents(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("GameEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}
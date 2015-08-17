package com.game.reel 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class ReelEvents extends Event 
	{
		public static const REEL_STOPPED:String 	= 	"reelStopped";
		public function ReelEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ReelEvents(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ReelEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}
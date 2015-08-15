package com.intro 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class IntroEvents extends Event 
	{
		public static const INTRO_DONE:String = "introDone";
		
		public function IntroEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new IntroEvents(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("IntroEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}
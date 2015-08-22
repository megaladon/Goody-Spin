package com.game.animation 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class AnimationEvents extends Event 
	{
		public static const ANIMATION_DONE:String = "animationDone";
		public function AnimationEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new AnimationEvents(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("AnimationEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}
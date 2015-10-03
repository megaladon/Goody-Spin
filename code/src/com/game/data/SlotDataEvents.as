package com.game.data {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class SlotDataEvents extends Event 
	{
		public static const ANIMALS:String = "animals";
		public static const VEHICLES:String = "vehicles";
		
		public function SlotDataEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new SlotDataEvents(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("SlotDataEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}
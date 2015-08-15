package com.game.data {
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class slotData 
	{
		
		public function slotData() 
		{
			// slot background
			// slot symbols
			//
			var _data:Object = [
				{category: "animals", slots:[{animationID: "pig1", slotID: ""}]}
			]; 
		}
		
		public function getSlotSymbols(slotType:String):void 
		{
			var symbols:Array = new Array();
			switch (slotType) 
			{
				case SlotDataEvents.ANIMALS:
					symbols = [];
				break;
				default:
			}
		
	}

}
package com.game.data {
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class SlotData extends MovieClip
	{
		private static var _data:Array;
		
		//public function SlotData() 
		{
			
			_data = [ 
				{
					slotType: SlotDataEvents.ANIMALS, reelData: 
								[
									{ animationID: "pig1", slotID: Symbol_pig },
									{ animationID: "chicken1", slotID: Symbol_chicken },
									{ animationID: "cow1", slotID: Symbol_cow },
									{ animationID: "ram1", slotID: Symbol_ram }							
								] 
				}
			];
		}
		
		public static function getSlotSymbols(slotType:String):Array 
		{
			var reelData:Array = new Array();
			for (var i:int = 0; i < _data.length ; i++) 
			{
				if (_data[i].slotType == slotType) 
				{
					reelData = _data[i].reelData;
				}
			}			
			return reelData;			
		}
		
	}

}
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
									{ animationID: pig1, 		slotID: Symbol_pig, 	title: "Pig" },
									{ animationID: chicken1, 	slotID: Symbol_chicken, title: "Chicken" },
									{ animationID: cow1, 		slotID: Symbol_cow, 	title: "Cow" },
									{ animationID: ram1, 		slotID: Symbol_ram, 	title: "Ram" }							
								] 
				}, 
				{
					slotType: "abcs", reelData: 
								[
									{ animationID: pig1, 		slotID: Symbol_pig, 	title: "Pig" },
									{ animationID: chicken1, 	slotID: Symbol_chicken, title: "Chicken" },
									{ animationID: cow1, 		slotID: Symbol_cow, 	title: "Cow" },
									{ animationID: ram1, 		slotID: Symbol_ram, 	title: "Ram" }							
								] 
				}, 
				{
					slotType: "shapes", reelData: 
								[
									{ animationID: pig1, 		slotID: Symbol_pig, 	title: "Pig" },
									{ animationID: chicken1, 	slotID: Symbol_chicken, title: "Chicken" },
									{ animationID: cow1, 		slotID: Symbol_cow, 	title: "Cow" },
									{ animationID: ram1, 		slotID: Symbol_ram, 	title: "Ram" }							
								] 
				}, 
				{
					slotType: "numbers", reelData: 
								[
									{ animationID: pig1, 		slotID: Symbol_pig, 	title: "Pig" },
									{ animationID: chicken1, 	slotID: Symbol_chicken, title: "Chicken" },
									{ animationID: cow1, 		slotID: Symbol_cow, 	title: "Cow" },
									{ animationID: ram1, 		slotID: Symbol_ram, 	title: "Ram" }							
								] 
				}, 
				{
					slotType: "vehicals", reelData: 
								[
									{ animationID: pig1, 		slotID: Symbol_pig, 	title: "Pig" },
									{ animationID: chicken1, 	slotID: Symbol_chicken, title: "Chicken" },
									{ animationID: cow1, 		slotID: Symbol_cow, 	title: "Cow" },
									{ animationID: ram1, 		slotID: Symbol_ram, 	title: "Ram" }							
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
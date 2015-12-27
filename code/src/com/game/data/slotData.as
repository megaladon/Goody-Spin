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
									slotType: SlotDataEvents.VEHICLES, reelData: 
								[
									{ animationID: Animation_bike,				slotID: Symbol_bike, 			title: "Bike" },			
									{ animationID: Animation_taxi, 				slotID: Symbol_taxi, 			title: "Taxi" },
									{ animationID: Animation_motorcycle,		slotID: Symbol_motorcycle, 		title: "Motorcycle" },
									{ animationID: Animation_dump_truck,		slotID: Symbol_dump_truck, 		title: "Dump Truck" },
									{ animationID: Animation_race_car,			slotID: Symbol_race_car, 		title: "Race Car" },
									{ animationID: Animation_ambulance,			slotID: Symbol_ambulance, 		title: "Ambulance" },
									{ animationID: Animation_firetruck,			slotID: Symbol_firetruck, 		title: "Fire Truck" },
									{ animationID: Animation_mail_truck,		slotID: Symbol_mail_truck, 		title: "Mail Truck" },
									{ animationID: Animation_police_car,		slotID: Symbol_police_car, 		title: "Police Car" },
									{ animationID: Animation_tractor,			slotID: Symbol_tractor, 		title: "Tractor" },
									{ animationID: Animation_icecream_truck,	slotID: Symbol_icecream_truck, 	title: "Icecream Truck" },
									{ animationID: Animation_train,				slotID: Symbol_train, 			title: "Train" },
									{ animationID: Animation_airplane,			slotID: Symbol_airplane, 		title: "Airplane" },
									{ animationID: Animation_school_bus,		slotID: Symbol_school_bus, 		title: "School Bus" },	
								] 
				}
			];
		}
		
		public static function getSlotSymbols(slotType:String):Array 
		{
			trace("getSlotSymbols " +slotType );
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
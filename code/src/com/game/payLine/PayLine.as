package com.game.payLine 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class PayLine extends MovieClip 
	{
		public const SYMBOL_ON_PAYLINE:String = "symbolOnPayLine";
		
		private var _clip:MovieClip;
		private var _reelData:Array;
		private var _targetSymbolID:Class;
		
		public function PayLine() 
		{
			_clip = new payline();
			addChild( _clip );			
		}
		
		/*
		// TODO: maybe pull all of this out and put it in games.as?
		public function watchForSymbol(reelData:Array, targetSymbolID:Class):void 
		{
			trace("watchForSymbol");
			_reelData = reelData;
			_targetSymbolID = targetSymbolID
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
//			trace("loop " + _clip.x+ " "+_clip.y + " " + _reelData.clip.x + " " + _reelData.clip.y+" "+_reelData.slotID);
			
			for (var i:int = 0; i < _reelData.length; i++) 
			{
				trace("loop " + _reelData[i].clip +""+_clip);
				if ( _clip.hitTestObject(_reelData[i].clip) )
				{
					trace("match");
					if (_reelData[i].slotID == _targetSymbolID ) {
						trace("loop - symbol found");
						removeEventListener(Event.ENTER_FRAME, loop);
						dispatchEvent( new Event(SYMBOL_ON_PAYLINE) );
					}				
				}
			}
			
			
		}
		*/
		public function get clip():MovieClip 
		{
			return _clip;
		}
		
	}

}
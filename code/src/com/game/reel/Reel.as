package com.game.reel 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import flash.display.*
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class Reel extends MovieClip 
	{
		private var _data:Array;
		private var _reelSymbols:Array;
		private var _isMoving:Boolean;
		private var _interval:Number;
		
		public function Reel(data:Array) 
		{
			_data = data;
			
			init();
			//if (stage) init();
			//else addEventListener(Event.ADDED_TO_STAGE, init);				
		}
		
		private function init(e:Event = null):void 
		{
			var clip:MovieClip //= new MovieClip();
			_reelSymbols = [];
			for (var j:int = 0; j < 30; j++) 
			{
				for (var i:int = 0; i < _data.length; i++) 
				{
					clip = new _data[i].slotID();
					var sum:Number = (clip.height * i)  + ((clip.height * 4) * j)					
					clip.y = (clip.height * i)  + ((clip.height * 4) * j);
					_data[i].clip = clip;
					var clipData:Object = { animationID: _data[i].animationID, slotID: _data[i].slotID, clip: clip };
					_reelSymbols.push( clipData );
					addChild( clip );
				}
			}
		}
		
		public function reset():void 
		{
			for (var i:int = 0; i < _reelSymbols.length; i++) 
			{
				_reelSymbols[i].clip.alpha = 1;
			}
		}
		
		public function get reelSymbols():Array 
		{
			return _reelSymbols;
		}
		
		public function get isMoving():Boolean 
		{
			return _isMoving;
		}
		
		public function set isMoving(value:Boolean):void 
		{
			_isMoving = value;
		}
		
		public function get interval():Number 
		{
			return _interval;
		}
		
		public function set interval(value:Number):void 
		{
			_interval = value;
		}
		
		
	}

}
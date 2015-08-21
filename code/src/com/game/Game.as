package com.game 
{
	import com.game.animation.Animation;
	import com.game.animation.AnimationEvents;
	import com.game.data.SlotData;
	import com.game.payLine.PayLine;
	import com.game.reel.Reel;
	import com.game.reel.ReelEvents;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Linear;
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.clearInterval;
	import flash.utils.getDefinitionByName;
	import flash.utils.setInterval;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class Game extends MovieClip 
	{
		private var _reel1:Reel;
		private var _reel2:Reel;
		private var _reel3:Reel;
		//private var _isReelMoving:Boolean;
		private var _reelData:Array;
		private var _payLine:PayLine;
		private var _interval:Number;
		private var _gameMode:String = "toddler";
		private var _gameState:String 
		
		// toddler mode vars
		private var _currSymbolNum:int
		private var _isWatchingForSymbol:Boolean;
		private var _numReelsStopped:int;
		private var _slotType:String;
		private var _animation:Animation;
		
		public function Game(slotType:String) 
		{
			trace("init slot type: " + slotType);	
			_slotType = slotType;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);			
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_reelData = SlotData.getSlotSymbols( _slotType );
			
			//var gameData:Array = 
			//[ 
				//{
					//slotType: "Animals", reelData: 
								//[
									//{ animationID: "pig1", slotID: Symbol_pig },
									//{ animationID: "chicken1", slotID: Symbol_chicken },
									//{ animationID: "cow1", slotID: Symbol_cow },
									//{ animationID: "ram1", slotID: Symbol_ram }							
								//] 
				//}
			//];
			
			//for (var i:int = 0; i < gameData.length ; i++) 
			//{
				//if (gameData[i].slotType == _slotType) 
				//{
					//_reelData = gameData[i].reelData
				//}
			//}
			
			_reel1 		= new Reel(_reelData);
			_reel1.addEventListener(ReelEvents.REEL_STOPPED, reelHasStopped);
			_reel1.x 	= 320;
			_reel1.y 	= -_reel1.height + 800 ;
			
			_reel2 		= new Reel(_reelData);
			_reel2.addEventListener(ReelEvents.REEL_STOPPED, reelHasStopped);
			_reel2.x 	= _reel1.x + _reel2.width;
			_reel2.y 	= -_reel1.height + 800 ;
			
			_reel3 		= new Reel(_reelData);
			_reel3.addEventListener(ReelEvents.REEL_STOPPED, reelHasStopped);
			_reel3.x 	= _reel2.x + _reel3.width;
			_reel3.y 	= -_reel1.height + 800 ;
			_numReelsStopped = 0;
			_currSymbolNum = 0;	
			addChild(_reel1);
			addChild(_reel2);
			addChild(_reel3);
			
			_payLine = new PayLine();
			_payLine.x = _payLine.width/2;
			_payLine.y = 384;
			addChild( _payLine );
			
			var _forground:MovieClip = new basic_foreground();
			addChild( _forground );			
			
			var _spin_btn:MovieClip = new spin_btn();
			_spin_btn.x = 448;
			_spin_btn.y = 640;
			_spin_btn.addEventListener(MouseEvent.CLICK, onSpin);
			addChild(_spin_btn);	;
			addEventListener(Event.ENTER_FRAME, run);
		}
		
		private function resetReels():void 
		{
			_reel1.reset();
			_reel2.reset();
			_reel3.reset();
		}
		
		private function resetReel(reel:Reel):void 
		{			
			for (var i:int = 0; i < reel.reelSymbols.length; i++) 
			{
				reel.reelSymbols[i].alpha = 1;
			}
		}
		
		private function onSpin(e:Event):void 
		{			
			resetReels();
			_numReelsStopped = 0;
			_reel1.isMoving = !_reel1.isMoving;
			_reel2.isMoving = !_reel2.isMoving;
			_reel3.isMoving = !_reel3.isMoving;
			var _reelSpeeds:Array = [ [1000, 1200, 1300] ]; 						
			_reel1.interval = setInterval(stopReel, 1000, _reel1);
			updateGameState(GameEvents.SPINNING);
		}
		
		private function stopReel(reel:Reel):void 
		{
			clearInterval(reel.interval);
			
			if (_gameMode == "toddler") 
			{				
				// TODO: choose a stop package/speed here and set it
				_isWatchingForSymbol = true;
			}
		}
		
		private function reelHasStopped(e:ReelEvents):void 
		{
			_numReelsStopped++;
			if (_numReelsStopped == 3) 
			{
				trace("JACKPOT! Play Animation! " +_currSymbolNum + " " + _reelData[_currSymbolNum].animationID );
				_animation = new Animation( _reelData[_currSymbolNum].animationID, _reelData[_currSymbolNum].title );
				_animation.addEventListener(AnimationEvents.ANIMATION_DONE, animationDone);
				addChild( _animation );
				onAnimationDone();
			}
		}
		
		private function animationDone(e:AnimationEvents):void 
		{
			removeChild( _animation );
			_animation = null;
		}
		
		private function onAnimationDone(e:Event = null):void 
		{
			_currSymbolNum++;
		}
		
		private function startWatchForSymbol():void 
		{
			if (_reel1.isMoving) 
			{
				
			}else if (_reel2.isMoving) 
			{
				_isWatchingForSymbol = true;
			}else if (_reel3.isMoving) 
			{
				_isWatchingForSymbol = true;
			}
		}		
		/**
		 * Figure out which symbol is touching the payline and returns it's data
		 * @param	e
		 */
		private function getSymbolOnPayLine (reelSymbols:Array):Object 
		{
			for (var i:int = 0; i < reelSymbols.length; i++) 
			{
				if ( MovieClip( reelSymbols[i].clip).hitTestObject( _payLine ) ) var clip:Object = reelSymbols[i];					
			}	
			return clip;
		}
		
		private function updateGameState(state:String):void 
		{
			_gameState = state;
		}
		
		private function run(e:Event):void 
		{			
			switch (_gameState) 
			{
				case GameEvents.WAITING_FOR_USER:
					
				break;
				case  GameEvents.SPINNING:
					spinReels();
				break;
				case GameEvents.SHOWING_ANIMATGION:
					
				break;
				default:
			}
		}
		
		private function spinReels():void 
		{
			if (_reel1.isMoving) _reel1.y += 40;
			if (_reel2.isMoving) _reel2.y += 40;
			if (_reel3.isMoving) _reel3.y += 40;	
			
			if (_isWatchingForSymbol) 
			{
				if (_reel1.isMoving) 
				{
					watchForSymbol(_reel1, _reelData[_currSymbolNum].slotID );
				}else if (_reel2.isMoving) 
				{
					watchForSymbol(_reel2, _reelData[_currSymbolNum].slotID );
					
				}else if (_reel3.isMoving) 
				{
					watchForSymbol(_reel3, _reelData[_currSymbolNum].slotID );		
				}
			}
		}
		/**
		 * Stops the specified reel on a the specified symbol
		 * @param	reel
		 * @param	targetSymbolData
		 */
		private function watchForSymbol(reel:Reel, targetSymbolData:Class):void 
		{
			for (var i:int = 0; i < reel.reelSymbols.length; i++) 
			{
				if ( _payLine.clip.hitTestObject(reel.reelSymbols[i].clip) )
				{
					if (reel.reelSymbols[i].slotID == targetSymbolData) 
					{
						reel.isMoving = false;
						balanceReel(reel);
						if ( areAnyReelsStillSpinning() ) TweenMax.delayedCall(2, startWatchForSymbol);
						_isWatchingForSymbol = false;
					}
				}				
				
			}
		}
		
		private function areAnyReelsStillSpinning():Boolean 
		{
			var bool:Boolean = false;
			if (_reel1.isMoving || _reel2.isMoving || _reel3.isMoving) bool = true;
			return true;
		}
		/**
		 * Lines up the current symbol of the specified reel on the payline and sets it's current symbol.
		 */
		private function balanceReel(reel:Reel):void 
		{
			reel.onReelBalanced( getSymbolOnPayLine(reel.reelSymbols));
			var dist:Number = (reel.currentSymbol.clip.y + reel.y) - _payLine.y ;			
			var destination:Number
			if (dist > 0 && reel.y < 0 || dist < 0 && reel.y < 0) 
			{
				destination = reel.y - dist;
			}else {	
				destination = reel.y + dist;
			}			
			TweenMax.to( reel, .3, { y: destination, ease:Bounce.easeInOut } );			
		}
		
		private function getDistance(pObj1:MovieClip,pObj2:MovieClip):Number {
			var distX:Number = pObj1.x - pObj2.x;
			var distY:Number = pObj1.y - pObj2.y;
			return Math.sqrt(distX * distX + distY * distY);
		}
		
	}

}
package com.game.animation 
{
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Linear;
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class Animation extends MovieClip 
	{
		private var _animationID:Class;
		private var _title:String;
		private var _titleHolder:titleHolder;
		private var _bg:MovieClip;
		private var _mainAnimation:MovieClip;
		
		public function Animation(animationID:Class, title:String) 
		{
			_animationID = animationID;
			_title = title;
			addEventListener(Event.ADDED_TO_STAGE, init );		
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_bg = new animationBG();
			var _bgWidth:Number = _bg.width;
			var _bgHeigth:Number = _bg.height;
			_bg.x = 535.55;
			_bg.y = 362;
			_bg.width -= _bg.width * .75; 
			_bg.height -= _bg.height * .75; 
			
			addChild( _bg );
			// Bring in background
			TweenMax.to( _bg, .5, { width: _bgWidth, height: _bgHeigth, ease:Bounce.easeOut, onComplete: animateInMainAnimation } );	
			//animateInMainAnimation()
			// Bring in title
			// Bring in animation
			
			// Check for end of animation
		}
		
		private function animateInTitle():void 
		{
			_titleHolder = new titleHolder();
			_titleHolder.t.text =  _title;
			_titleHolder.y = -(_titleHolder.height);
			addChild(_titleHolder);
			
			TweenMax.to(_titleHolder, .5, {y:0, ease:Bounce.easeInOut, onComplete:  playMainAnimation} );
		}
		
		private function animateInMainAnimation():void 
		{
			_mainAnimation = new _animationID();			
			addChild(_mainAnimation);
			TweenMax.to(_mainAnimation, 1, {alpha: 1, onComplete:  animateInTitle} );
			//playMainAnimation();
		}
		
		private function playMainAnimation():void 
		{
			_mainAnimation.ani.gotoAndPlay("action");
			addEventListener(Event.ENTER_FRAME, checkAnimationDone);
		}
		
		private function checkAnimationDone(e:Event):void 
		{
			if (_mainAnimation.ani.currentFrame == _mainAnimation.ani.totalFrames) 
			{
				removeEventListener(Event.ENTER_FRAME, checkAnimationDone);
				animateOutTitle();
				
			}
		}
		
		private function animatOutMainAnimation():void 
		{
			removeChild(_mainAnimation);
				//TweenMax.to(_mainAnimation, 1, {alpha: 0, onComplete:  animateOutTitle} );	
		}
		
		private function animateOutTitle():void 
		{			
			animatOutMainAnimation()
			TweenMax.to(_titleHolder, .5, {y:-(_titleHolder.height), ease:Bounce.easeInOut, onComplete:  animateOutBG} );		
		}
		
		private function animateOutBG():void 
		{
			
			var w:Number =_bg.width - ( _bg.width * .75); 
			var h:Number = _bg.height - ( _bg.height * .75); 
			TweenMax.to( _bg, .5, { width: w, height: h, ease:Bounce.easeIn, onComplete: animatieOurBGDone } );
			
		}
		
		private function animatieOurBGDone():void 
		{
			
				dispatchEvent( new AnimationEvents(AnimationEvents.ANIMATION_DONE) )
		}
		
	}

}
package com.intro 
{
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Linear;
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Keith Goodman
	 */
	public class Intro extends MovieClip 
	{
		
		public function Intro() 
		{
			var _clip:MovieClip = new goodyMash();
			//_clip.goodyText.y
			addChild(_clip);
			
			//TweenMax.to( _clip, 2, { y: 0, ease:Linear.easeNone, onComplete: comeBackOnScreen, onCompleteParams:[startX, returnStartX, returnSpeed] } );
			TweenMax.to( _clip.goodyText, 1, { y: 0, delay: 1, ease:Bounce.easeOut, onComplete: introDone } );
		}
		
		private function introDone():void 
		{
			dispatchEvent( new IntroEvents(IntroEvents.INTRO_DONE) );
		}
		
	}

}
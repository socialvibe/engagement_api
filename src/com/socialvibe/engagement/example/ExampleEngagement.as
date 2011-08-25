package com.socialvibe.engagement.example
{
	import com.socialvibe.engagement.api.SocialVibeProxy;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ExampleEngagement extends Sprite
	{
		/**
		 * This is the API you will be using for calls.
		 * Please pay attention to the code hinting that comes up.
		 * */
		private var _api:SocialVibeProxy;
		
		public function ExampleEngagement()
		{
			// 1. Listen for the ADDED_TO_STAGE event.  You will not be able to initialize the API or access the 'stage' until then.
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// 2. Initialize the API
			_api = new SocialVibeProxy();
			
			var g:Graphics = this.graphics;
			g.beginFill(0x123456, 1);
			g.drawRect(0, 0, 750, 500);
			
			// This is a very simple engagement.  Clicking on this box, makes the 'engage()' call to credit the user their user benefit (i.e. Farm Cash)
			//This particular engagement ends when the user clicks this button.
			var button:Sprite = new Sprite();
			this.addChild(button);
			button.graphics.beginFill(0xFFFFFF, 1);
			button.graphics.drawRect(275, 200, 200, 50);
			button.graphics.endFill();
		
			button.useHandCursor = button.buttonMode = true;
			button.addEventListener(MouseEvent.CLICK, onEngage);
		}
		
		private function onEngage(e:Event):void
		{
			// 3. Call to engage()
			_api.engage();
			
			// 4. Call endEngage() when you want the engagement to end and to show the user a 'Congrats & Share' screen.  Note: This can happen anytime after the call to engage()
			_api.endEngage();
		}
	}
}
package
{
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
			// 1.Initialize the API, and make sure it's ready before using it.
			_api = new SocialVibeProxy();
			_api.addEventListener(SocialvibeProxy.READY, onReady);
			_api.init();
		}
		
		private function onReady(e:Event):void
		{
			//2. DO ready activities after the API is ready and initialized.
			trace ("Ready!");
			
			
			//This particular engagement ends when the user clicks this button.
			var button:Sprite = new Sprite();
			this.addChild(button);
			button.graphics.beginFill(0x123456, 1);
			button.graphics.drawRoundRect(0, 0, 150, 50, 16);
			button.graphics.endFill();
		
			button.useHandCursor = button.buttonMode = true;
			button.addEventListener(MouseEvent.CLICK, onEnd);
			
		}
		
		private function onEnd(e:Event):void
		{
			//3. On the end point of your engagement, that you want to call end, call this function.
			_api.engage();
			_api.endEngage();
		}
	}
}
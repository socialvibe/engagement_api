package com.socialvibe.engagement.api
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.setTimeout;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	public class SocialVibeProxy extends EventDispatcher
	{
		private var _unconnectedMode:Boolean = true;
		
		private var EngagemantAPI:Class;
		private var EngagemantAPI_instance:*;
		
		private var FILE_NAME_SPACE:String = "com.socialvibe.engagement.EngagementAPI";
		
		public function SocialVibeProxy()
		{
			var domain:ApplicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
			
			try {
				EngagemantAPI = (ApplicationDomain.currentDomain.getDefinition(FILE_NAME_SPACE) as Class);
				
				EngagemantAPI_instance = EngagemantAPI['getInstance']();
				
				if (EngagemantAPI_instance)
				{
					EngagemantAPI_instance.startEngage();
					_unconnectedMode = false;	
				}
			}
			catch (e:Error)
			{
				_unconnectedMode = true;
				trace ("ENGAGEMENT API NOT FOUND::Running in unconnected mode.");
			}
		}
		
		public function set unconnectedMode(value:Boolean):void
		{
			_unconnectedMode = value;
		}
		
		public function get unconnectedMode():Boolean
		{
			return _unconnectedMode;
		}
		
		/* =================================
		ENGAGE API
		================================= */
		public function engage(onComplete:Function = null):void
		{
			if (_unconnectedMode)
			{
				trace ("SocialVibeProxy::engage()");
				if (onComplete != null)
				{
					setTimeout(onComplete, 1000);
				}
			}
			else
			{
				EngagemantAPI_instance.engage(onComplete);
			}
		}
		
		public function endEngage():void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::endEngage() - Congrats & Share screen should show now.");
			else
				EngagemantAPI_instance.endEngage();
		}
		
		public function saveCommentData(comment:String):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::saveCommentData(" + comment + ")");
			else
				EngagemantAPI_instance.saveCommentData(comment);
		}
		
		public function saveVoteData(category:Number, label:String, vote:Number):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::saveVoteData(" + category + ", " + label + ", " + vote + ")");
			else
				EngagemantAPI_instance.saveVoteData(category, label, vote);
		}
		
		public function getRecentComments():Array
		{
			if (_unconnectedMode)
			{
				trace ("SocialVibeProxy::getRecentComments()");
				
				return [{body:"last comment text", ago:"31 minutes ago"}, {body:"2nd to last comment text", ago:"36 minutes ago"}, {body:"3rd comment text", ago:"56 minutes ago"}, {body:"4th comment text", ago:"1 hour ago"}, {body:"5th comment text", ago:"2 hours ago"}];
			}
			
			return EngagemantAPI_instance.getRecentComments();
		}
		
		public function getVoteSummary():Array
		{
			if (_unconnectedMode)
			{
				trace ("SocialVibeProxy::getRecentComments()");
				
				return [
					{category:"1", label:"First answer choice from first question", vote:"1", vote_count:"25023"}, 
					{category:"1", label:"Second answer choice from first question", vote:"2", vote_count:"18652"}, 
					{category:"1", label:"Third answer choice from first question", vote:"3", vote_count:"15684"}, 
					{category:"1", label:"Fourth answer choice from first question", vote:"4", vote_count:"568"}
				];
			}
			
			return EngagemantAPI_instance.getVoteSummary();
		}
		
		
		/* =================================
		CONTAINER API
		================================= */
		public function get engagement_width():Number
		{
			if (_unconnectedMode)
				return 750;
			else
				return EngagemantAPI_instance.engagement_width;
		}
		
		public function get engagement_height():Number
		{
			if (_unconnectedMode)
				return 500;
			else
				return EngagemantAPI_instance.engagement_height;
		}
		
		
		/* =================================
		SOCIAL API
		================================= */
		public function shareToFacebook():void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::shareToFacebook()");
			else
				EngagemantAPI_instance.shareToFacebook();
		}
		
		public function shareToTwitter():void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::shareToTwitter()");
			else
				EngagemantAPI_instance.shareToTwitter();
		}
		
		public function disableSharing():void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::disableSharing()");
			else
				EngagemantAPI_instance.disableSharing();
		}
		
		public function addCustomShareParameter(param:String, value:String):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::addCustomShareParameter(" + param + ", " + value + ")");
			else
				EngagemantAPI_instance.addCustomShareParameter();
		}
		
		
		/* =================================
		EXTERNAL API
		================================= */
		public function popupFBPage(url:String = null, width:Number = 1024, height:Number = 800):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::popupFBPage(" + url + ", " + width + ", " + height + ")");
			else
				EngagemantAPI_instance.popupFBPage(url, width, height);
		}
		
		public function popupWebsite(url:String = null, width:Number = 1024, height:Number = 800):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::popupWebsite(" + url + ", " + width + ", " + height + ")");
			else
				EngagemantAPI_instance.popupWebsite(url, width, height);
		}
		
		public function popupTermsPage(url:String = null, width:Number = 1024, height:Number = 800):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::popupTermsPage(" + url + ", " + width + ", " + height + ")");
			else
				EngagemantAPI_instance.popupTermsPage(url, width, height);
		}
		
		
		/* =================================
		TRACKING API
		================================= */
		
		public function loadExternalTracking(pixel_url:String, add_timestamp:Boolean = false):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::loadExternalTracking(" + pixel_url + ", " + add_timestamp + ")");
			else
				EngagemantAPI_instance.loadExternalTracking(pixel_url, add_timestamp);
		}
		
		public function trackNavigationNext(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackNavigationNext(" + value + ")");
			else
				EngagemantAPI_instance.trackNavigationNext(value);
		}
		public function trackNavigationGoto(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackNavigationGoto(" + value + ")");
			else
				EngagemantAPI_instance.trackNavigationGoto(value);
		}
		public function trackNavigationSkip(value:Object = null, isShare:Boolean = false, isWebcam:Boolean = false):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackNavigationSkip(" + value + ", " + isShare + ", " + isWebcam + ")");
			else
				EngagemantAPI_instance.trackNavigationSkip(value, isShare, isWebcam);
		}
		public function trackNavigationDialog(value:Object = null, isWebcam:Boolean = false):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackNavigationDialog(" + value + ", " + isWebcam + ")");
			else
				EngagemantAPI_instance.trackNavigationDialog(value, isWebcam);
		}
		
		
		public function trackVideoStarted(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackVideoStarted(" + value + ")");
			else
				EngagemantAPI_instance.trackVideoStarted(value);
		}
		public function trackVideoCompleted(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackVideoCompleted(" + value + ")");
			else
				EngagemantAPI_instance.trackVideoCompleted(value);
		}
		public function trackGameStart(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackGameStart(" + value + ")");
			else
				EngagemantAPI_instance.trackGameStart(value);
		}
		public function trackGameEnd(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackGameEnd(" + value + ")");
			else
				EngagemantAPI_instance.trackGameEnd(value);
		}
		public function trackUpload(value:Object = null, isPhoto:Boolean = false, isVideo:Boolean = false):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackUpload(" + value + ", " + isPhoto + ", " + isVideo + ")");
			else
				EngagemantAPI_instance.trackUpload(value, isPhoto, isVideo);
		}
		public function trackSoundPlayed(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackSoundPlayed(" + value + ")");
			else
				EngagemantAPI_instance.trackSoundPlayed(value);
		}
		
		public function trackExternalPopup(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackExternalPopup(" + value + ")");
			else
				EngagemantAPI_instance.trackExternalPopup(value);
		}
		public function trackExternalFBPopup(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackExternalFBPopup(" + value + ")");
			else
				EngagemantAPI_instance.trackExternalFBPopup(value);
		}
		public function trackDownload(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackDownload(" + value + ")");
			else
				EngagemantAPI_instance.trackDownload(value);
		}
		public function trackPrint(value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackPrint(" + value + ")");
			else
				EngagemantAPI_instance.trackPrint(value);
		}
		
		public function trackAggregateInteraction(name:String, interaction_count:Number):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackAggregateInteraction(" + name + ", " + interaction_count + ")");
			else
				EngagemantAPI_instance.trackAggregateInteraction(name, interaction_count);
		}
		public function trackOtherInteraction(name:String, value:Object = null):void
		{
			if (_unconnectedMode)
				trace ("SocialVibeProxy::trackOtherInteraction(" + name + ", " + value + ")");
			else
				EngagemantAPI_instance.trackOtherInteraction(name, value);
		}
	}
}
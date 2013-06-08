package
{
	/**
	 * <p>Description: Use to dynamic load visual resouce</p>
	 * <b>Example:</b></br>
	 * var img:Image=new Image();</br>
	 * this.addChild(img);</br>
	 * img.url="1.jpg";</br></br>
	 * <ul>
	 * <li>Created time：2013-6-8 下午4:47:37 </li>
	 * <li>Version 1.0.0</li>
	 * <li>E-mail: hellogavin1988#gmail.com</li>
	 * </ul>
	 * @author zhengxuesong
	 * */ 
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class Image extends Sprite
	{
		private var _url:String
		private var _loader:Loader;
		private var _bitmap:Bitmap;
		public function Image()
		{
			_loader=new Loader();
			_bitmap=new Bitmap();
			this.addChild(_bitmap);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
			this.addEventListener(Event.REMOVED_FROM_STAGE,removeFromStage);
		}
		
		protected function removeFromStage(event:Event):void
		{
			this.removeChild(_bitmap);
			_bitmap.bitmapData.dispose();
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadComplete);
			_loader=null;
		}
		
		/**
		 * just dynamic update bitmap's bitmapdata,it doesn't need re-add it to stage 
		 * @param event
		 * 
		 */		
		protected function loadComplete(event:Event):void
		{
			_bitmap.bitmapData=event.currentTarget.content.bitmapData;
		}
		
		/**
		 *  
		 * @param value resourse 's url
		 * 
		 */		
		public function set url(value:String):void
		{
			_url=value;
			_loader.load(new URLRequest(_url));
		}
		
		public function get url():String
		{
			return _url;
		}
	}
} 
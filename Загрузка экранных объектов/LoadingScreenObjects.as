package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;

	public class LoadingScreenObjects extends Sprite{
		private var container:Sprite = new Sprite();
		private var pictLdr:Loader = new Loader();
		private var pictURL:String = "banan.jpg"; // файл banan.jpg расположен в папке bin-debug
		private var pictURLReq:URLRequest = new URLRequest(pictURL);
		
		public function LoadingScreenObjects(){  
			this.addChild(container);
			pictLdr.load(pictURLReq);
			
			pictLdr.contentLoaderInfo.addEventListener(Event.COMPLETE, imgLoaded);
		}
		private function imgLoaded(e:Event):void{
			container.addChild(pictLdr.content);
		}
		
	}
}
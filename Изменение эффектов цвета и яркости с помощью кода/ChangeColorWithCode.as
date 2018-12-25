package
{

	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Transform;
	import flash.net.URLRequest;
	
	
	public class ChangeColorWithCode extends Sprite
	{
		private var loader:Loader = new Loader();
		private var url:URLRequest = new URLRequest("http://www.helpexamples.com/flash/images/image1.jpg");
	
		
		public function ChangeColorWithCode()
		{  
			loader.load(url);
			this.addChild(loader);
			loader.addEventListener(MouseEvent.MOUSE_MOVE, adjustColor);
		}	
		private function adjustColor(e:MouseEvent):void{
			var colorTransformer:ColorTransform = loader.transform.colorTransform;
			colorTransformer.redMultiplier = (loader.mouseX / loader.width) * 1;
			colorTransformer.greenMultiplier = (loader.mouseY / loader.height) * 1;
			loader.transform.colorTransform = colorTransformer;
		}
	}
}
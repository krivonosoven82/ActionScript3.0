package{
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.ConvolutionFilter;
	import flash.net.URLRequest;
	
	
	public class ExampleConvolutionFilters extends Sprite{
		private var loader:Loader = new Loader();
		private var url:URLRequest = new URLRequest("http://www.helpexamples.com/flash/images/image1.jpg");
		
		public function ExampleConvolutionFilters(){ 
			loader.load(url);
			this.addChild(loader);
			loader.addEventListener(MouseEvent.CLICK, applyFilter);
		}
		private function applyFilter(e:MouseEvent):void{
			//Create the convolution matrix
//			var matrix:Array = [0, 0, 0, 
//								0, 0, 1, 
//								0, 0, 0];
//основное размытие - завечивание (делитель 5)			
//			var matrix:Array = [0, 1, 0, 
//								1, 1, 1, 
//								0, 1, 0];
//усиление резкости (делитель 1)			
//			var matrix:Array = [0, -1, 0, 
//								-1, 5, -1, 
//								0, -1, 0];
//выделение краев - затемнение(делитель 1)			
//			var matrix:Array = [0, -1, 0, 
//								-1, 4, -1, 
//								0, -1, 0];
//эффект выдавливания (делитель 1)			
			var matrix:Array = [-2, -1, 0, 
								-1, 1, 1, 
								0, 1, 2];

			var convolution:ConvolutionFilter = new ConvolutionFilter();
			convolution.matrixX = 3;
			convolution.matrixY = 3;
			convolution.matrix = matrix;
			convolution.divisor = 1;
			
			loader.filters = [convolution];
		}
		
	}
}
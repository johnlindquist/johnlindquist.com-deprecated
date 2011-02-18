/**
 * User: John Lindquist
 * Date: 2/18/11
 * Time: 5:44 PM
 */
package tiles
{
	import flash.display.BitmapData;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;

	public class GraphicFactory
	{
		private var graphics:Dictionary = new Dictionary();
		private var size:Number;


		public function GraphicFactory(size:Number)
		{
			this.size = size;
		}

		public function getGraphic(ascii:String):BitmapData
		{
			if(graphics[ascii]) return BitmapData(graphics[ascii]);
			
			var textField:TextField = new TextField();
			textField.text = ascii;
			textField.setTextFormat(new TextFormat("Lucida Console", size));

			var bitmapData:BitmapData;

			bitmapData = new BitmapData(size, size);
			bitmapData.draw(textField);
			
			return graphics[ascii] = bitmapData;
		}
	}
}
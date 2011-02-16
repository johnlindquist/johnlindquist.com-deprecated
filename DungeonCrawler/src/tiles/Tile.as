/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 12:03 AM
 */
package
tiles
{
	import characters.Allowable;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.text.TextField;

	public class Tile
	{
		private var _ascii:String;
		private var _graphic:Bitmap;
		public var isHidden:Boolean = false;

		private static var nullTile:NullTile;

		public function get ascii():String
		{
			return _ascii;
		}

		public function get graphic():Bitmap
		{
			return _graphic;
		}

		public static const BLANK_TILE:String = " ";

		public function Tile(ascii:String)
		{
			this._ascii = ascii;

			var textField:TextField = new TextField();
			textField.text = ascii;

			var bitmapData:BitmapData;

			bitmapData = new BitmapData(20, 20);
			bitmapData.draw(textField);

			_graphic = new Bitmap(bitmapData);

			if (_ascii == BLANK_TILE)
			{
				isHidden = true;
			}
		}

		public function accept(visitor:Allowable):void
		{
			visitor.allow();
		}

		public static function getNullTile():NullTile
		{
			return nullTile ||= new NullTile("/");
		}
	}
}
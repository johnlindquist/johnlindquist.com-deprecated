/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 1:02 AM
 */
package characters
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class Monster extends Sprite implements Visitable, Allowable
	{
		private var _ascii:String;
		private var _graphic:Bitmap;
		private static var _size:int;
		
		public function Monster(ascii:String, size:int)
		{
			this._ascii = ascii;
			_size = size;

			var textField:TextField = new TextField();
			textField.text = ascii;
			textField.setTextFormat(new TextFormat("Lucida Console", size, 0xff0000));

			var bitmapData:BitmapData;

			bitmapData = new BitmapData(size, size, true, 0x00000000);
			bitmapData.draw(textField);

			_graphic = new Bitmap(bitmapData);

			addChild(_graphic);
		}

		public function allow():void
		{
		}

		public function deny():void
		{
		}

		public function accept(visitor:Allowable):void
		{
			visitor.deny();
		}
		
		private static var nullMonster:NullMonster;
		public static const BLANK_MONSTER:String = " ";

		public static function getNullMonster():NullMonster
		{
			return nullMonster ||= new NullMonster(BLANK_MONSTER, 20);
		}
	}
}
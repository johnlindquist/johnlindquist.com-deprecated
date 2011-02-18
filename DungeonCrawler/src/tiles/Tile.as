/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 12:03 AM
 */
package
tiles
{
	import characters.Allowable;

	import com.untoldentertainment.pathfinding.INode;

	import flash.display.BitmapData;

	public class Tile implements INode
	{
		private var _graphic:BitmapData;
		public var isHidden:Boolean = false;

		private static var nullTile:NullTile;

		public function get graphic():BitmapData
		{
			return _graphic;
		}

		public function set graphic(value:BitmapData):void
		{
			_graphic = value;
		}

		public function Tile(graphic:BitmapData)
		{
			_graphic = graphic;
		}

		public function accept(visitor:Allowable):void
		{
			visitor.allow();
		}

		public static function getNullTile():NullTile
		{
			return nullTile ||= new NullTile(new BitmapData(1, 1));
		}

		private var _parentNode:INode;
		private var _f:Number;
		private var _g:Number;
		private var _h:Number;
		private var _traversable:Boolean = true;

		//Some 
		private var _y:int;
		private var _col:int;

		public function Node(column:int, row:int)
		{
			this.y = row;
			this.x = column;
		}

		public function get parentNode():INode { return _parentNode; }
		public function set parentNode(value:INode):void
		{
			_parentNode = value;
		}

		public function get f():Number { return _f; }
		public function set f(value:Number):void
		{
			_f = value;
		}

		public function get g():Number { return _g; }
		public function set g(value:Number):void
		{
			_g = value;
		}

		public function get h():Number { return _h; }
		public function set h(value:Number):void
		{
			_h = value;
		}

		public function get traversable():Boolean { return _traversable; }
		public function set traversable(value:Boolean):void
		{
			_traversable = value;
		}

		public function get y():int { return _y; }
		public function set y(value:int):void
		{
			_y = value;
		}

		public function get x():int { return _col; }
		public function set x(value:int):void
		{
			_col = value;
		}
	}
}
/**
 * User: John Lindquist
 * Date: 2/15/11
 * Time: 10:46 PM
 */
package
collections
{
	public class Array2D
	{
		private var _source:Array;
		public function get source():Array
		{
			return _source;
		}

		private var _columns:int;
		public function get columns():int
		{
			return _columns;
		}

		private var _rows:int;
		public function get rows():int
		{
			return _rows;
		}

		public function Array2D(columns:int, rows:int, defaultValue:* = 0)
		{
			_source = new Array();
			for (var i:int = 0; i < columns; i++)
			{
				var rowArray:Array = new Array();
				for (var j:int = 0; j < rows; j++)
				{
					rowArray[j] = defaultValue;
				}

				_source.push(rowArray);
			}

			_columns = columns;
			_rows = rows;
		}

		public function populate(value:*):void
		{
			for (var i:int = 0; i < _source.length; i++)
			{
				var rowArray:Array = _source[i];
				for (var j:int = 0; j < rows; j++)
				{
					rowArray[j] = value;
				}
			}
		}
	}
}
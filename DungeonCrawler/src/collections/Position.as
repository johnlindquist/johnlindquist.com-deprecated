/**
 * User: John Lindquist
 * Date: 2/16/11
 * Time: 3:26 AM
 */
package collections
{
	public class Position
	{
		private var _column:uint;
		private var _row:uint;

		public function set column(value:uint):void
		{
			_column = value;
		}

		public function set row(value:uint):void
		{
			_row = value;
		}

		public function get column():uint
		{
			return _column;
		}

		public function get row():uint
		{
			return _row;
		}

		public function Position(column:uint, row:uint)
		{
			this._column = column;
			this._row = row;
		}

		public function clone():Position
		{
			return new Position(this.column, this.row);
		}
	}
}
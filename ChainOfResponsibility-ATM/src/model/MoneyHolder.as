/**
 * User: John Lindquist
 * Date: 2/1/11
 * Time: 10:46 AM
 */
package model
{
	public class MoneyHolder
	{
		private var _hundreds:int = 0;
		private var _twenties:int = 0;
		private var _tens:int = 0;
		private var _fives:int = 0;
		private var _ones:int = 0;

		public function get hundreds():int
		{
			return _hundreds;
		}

		public function set hundreds(value:int):void
		{
			_hundreds = value;
		}

		public function get twenties():int
		{
			return _twenties;
		}

		public function set twenties(value:int):void
		{
			_twenties = value;
		}

		public function get tens():int
		{
			return _tens;
		}

		public function set tens(value:int):void
		{
			_tens = value;
		}

		public function get fives():int
		{
			return _fives;
		}

		public function set fives(value:int):void
		{
			_fives = value;
		}

		public function get ones():int
		{
			return _ones;
		}

		public function set ones(value:int):void
		{
			_ones = value;
		}
	}
}
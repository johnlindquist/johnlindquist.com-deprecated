/**
 * User: John Lindquist
 * Date: 2/1/11
 * Time: 10:44 AM
 */
package model
{
	public class Dude extends MoneyHolder
	{
		public var moneyNeeded:int;


		override public function set hundreds(value:int):void
		{
			moneyNeeded -= 100;
			super.hundreds = value;
			displayTotal();
		}

		override public function set twenties(value:int):void
		{
			moneyNeeded -= 20;
			super.twenties = value;
			displayTotal();
		}


		override public function set tens(value:int):void
		{
			moneyNeeded -= 10;
			super.tens = value;
			displayTotal();
		}


		override public function set fives(value:int):void
		{
			moneyNeeded -= 5
			super.fives = value;
			displayTotal();
		}


		override public function set ones(value:int):void
		{
			moneyNeeded -= 1;
			super.ones = value;
			displayTotal();
		}


		private function displayTotal():void
		{
			trace("I have " + hundreds + " hundreds, " + twenties + " twenties, " + tens + " tens, " + fives + " fives, and " + ones + " ones");
			if (moneyNeeded > 0)
			{
				trace("I still need " + moneyNeeded);
			}
			else
			{
				trace("I've got all I need, thanks!");
			}
		}
	}
}
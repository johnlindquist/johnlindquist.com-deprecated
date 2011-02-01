/**
 * User: John Lindquist
 * Date: 2/1/11
 * Time: 10:36 AM
 */
package chain
{
	import model.Bank;
	import model.Dude;

	public class HundredsProcessor extends MoneyProcessorChain
	{
		override public function process(dude:Dude, bank:Bank):void
		{
			if(bank.hundreds > 0 && dude.moneyNeeded > 100)
			{
				bank.hundreds--;
				dude.hundreds++;
			}
			else
			{
				super.process(dude, bank);
			}
		}
	}
}
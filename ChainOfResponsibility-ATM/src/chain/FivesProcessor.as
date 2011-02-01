/**
 * User: John Lindquist
 * Date: 2/1/11
 * Time: 10:36 AM
 */
package chain
{
	import model.Bank;
	import model.Dude;

	public class FivesProcessor extends MoneyProcessorChain
	{
		override public function process(dude:Dude, bank:Bank):void
		{
			if(bank.tens > 0 && dude.moneyNeeded > 20)
			{
				bank.tens--;
				dude.tens++;
				process(dude, null);
			}
			else
			{
				super.process(dude, bank);
			}
		}
	}
}
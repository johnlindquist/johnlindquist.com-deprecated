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
			if(bank.fives > 0 && dude.moneyNeeded > 5)
			{
				bank.fives--;
				dude.fives++;
			}
			else
			{
				super.process(dude, bank);
			}
		}
	}
}
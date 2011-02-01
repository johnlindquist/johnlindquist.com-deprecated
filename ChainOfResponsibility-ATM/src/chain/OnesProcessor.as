/**
 * User: John Lindquist
 * Date: 2/1/11
 * Time: 10:36 AM
 */
package chain
{
	import model.Bank;
	import model.Dude;

	public class OnesProcessor extends MoneyProcessorChain
	{
		override public function process(dude:Dude, bank:Bank):void
		{
			if(bank.ones > 0 && dude.moneyNeeded > 0)
			{
				bank.ones--;
				dude.ones++;
			}
			else
			{
				super.process(dude, bank);
			}
		}
	}
}
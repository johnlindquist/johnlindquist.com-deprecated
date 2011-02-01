/**
 * User: John Lindquist
 * Date: 2/1/11
 * Time: 10:36 AM
 */
package chain
{
	import model.Bank;
	import model.Dude;

	public class TwentiesProcessor extends MoneyProcessorChain
	{
		override public function process(dude:Dude, bank:Bank):void
		{
			if(bank.twenties > 0 && dude.moneyNeeded > 20)
			{
				bank.twenties--;
				dude.twenties++;
			}
			else
			{
				super.process(dude, bank);
			}
		}
	}
}
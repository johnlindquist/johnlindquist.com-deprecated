/**
 * User: John Lindquist
 * Date: 2/1/11
 * Time: 10:37 AM
 */
package chain
{
	import model.Bank;
	import model.Dude;

	public class MoneyProcessorChain
	{
		protected var nextLink:MoneyProcessorChain;

		public function setNextLink(moneyChain:MoneyProcessorChain):void
		{
			nextLink = moneyChain;
		}

		public function process(dude:Dude, bank:Bank):void
		{
			if(nextLink)
			{
				nextLink.process(dude, bank);
			}
			else
			{
				trace("The bank can't fulfill your request.")
			}
		}
	}
}
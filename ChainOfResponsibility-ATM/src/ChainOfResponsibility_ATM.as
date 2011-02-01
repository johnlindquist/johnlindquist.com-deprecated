package
{
	import chain.FivesProcessor;
	import chain.HundredsProcessor;
	import chain.OnesProcessor;
	import chain.TensProcessor;
	import chain.TwentiesProcessor;

	import flash.display.Sprite;

	import model.Bank;
	import model.Dude;

	public class ChainOfResponsibility_ATM extends Sprite
	{
		public function ChainOfResponsibility_ATM()
		{
			var bank:Bank = new Bank();
			bank.hundreds = 1;
			bank.twenties = 1;
			bank.tens = 1;
			bank.fives = 1;
			bank.ones = 1000;

			var dude:Dude = new Dude();
			dude.moneyNeeded = 979;

			var hundreds:HundredsProcessor = new HundredsProcessor();
			var twenties:TwentiesProcessor = new TwentiesProcessor();
			var tens:TensProcessor = new TensProcessor();
			var fives:FivesProcessor = new FivesProcessor();
			var ones:OnesProcessor = new OnesProcessor();

			hundreds.setNextLink(twenties);
			twenties.setNextLink(tens);
			tens.setNextLink(fives);
			fives.setNextLink(ones);

			while (dude.moneyNeeded > 0 && bank.hasMoney)
			{
				hundreds.process(dude, bank);
			}
		}
	}
}

/**
 * User: John Lindquist
 * Date: Aug 31, 2010
 * Time: 2:24:01 AM
 */
package patterncraft.state
{
    public class SiegeState implements ISiegeTankState
    {
        private var siegeTank:SiegeTank;

        public function SiegeState(siegeTank:SiegeTank)
        {
            this.siegeTank = siegeTank;
        }

        public function get damage():Number
        {
            return 20;
        }

        public function get canMove():Boolean
        {
            return false;
        }

        public function get color():uint
        {
            return 0x00cc00;
        }
        
        public function move(targetX:Number, targetY:Number):void
        {
            siegeTank.moveTextField.text = "Can't move :( ";
        }
        
        public function attack():void
        {
            siegeTank.attackTextField.text = "Attacking for " + damage;
        }
        
        public function toTankMode():void
        {
            siegeTank.state = siegeTank.tankState;
        }

        public function toSiegeMode():void
        {
            siegeTank.messageTextField.text = "Already in Siege Mode!";
        }
        
        public function toSpeedMode():void
        {
            siegeTank.messageTextField.text = "Can't go to speed from siege";
        }
    }
}
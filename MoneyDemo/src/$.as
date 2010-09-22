package
{
    public function $(type:Class = null, instance:Object = null):IMoney
    {
        //TODO: implement "id"
        Money.currentType = type;
        Money.currentInstance = instance;
        return Money.getInstance();
    }
}

class Money implements IMoney
{
    static var instance:Money;

    static var currentType:Class;
    static var currentInstance:Object;
    static var currentRest:Array;

    static function getInstance():Money
    {
        return instance ||= new Money();
    }

    public function get():*
    {
        if (currentType)
        {
            return getValue(currentType);
        }

        return {};
    }

    public function put(...rest):void
    {
        if (currentInstance && currentType)
        {
            putValue(currentInstance, currentType);
        }
        else if (currentType)
        {
            putValue(newInstance(currentType, rest), currentType);
        }

    }

    public function post(...rest):void
    {
        var instance:* = newInstance(currentType, rest);
        if (instance.hasOwnProperty("execute"))
        {
            instance.execute();
        }
    }

    public function remove():void
    {
        deleteValue(currentType);        
    }
}

import flash.utils.Dictionary;

var map:Dictionary = new Dictionary();

function putValue(instance:*, type:Class):void
{
    map[type] = instance;
    trace(instance, " mapped to ", type);
}

function getValue(type:Class)
{
    if (!map[type])
    {
        putValue(new type(), type);
    }
    return map[type];
}

function deleteValue(type:Class)
{
    map[type] = null;
}

function newInstance(clazz:Class, args:Array = null):*
{
    var result:*;
    var a:Array = (args == null) ? [] : args;

    switch (a.length)
    {
        case 1:
            result = new clazz(a[0]);
            break;
        case 2:
            result = new clazz(a[0], a[1]);
            break;
        case 3:
            result = new clazz(a[0], a[1], a[2]);
            break;
        case 4:
            result = new clazz(a[0], a[1], a[2], a[3]);
            break;
        case 5:
            result = new clazz(a[0], a[1], a[2], a[3], a[4]);
            break;
        case 6:
            result = new clazz(a[0], a[1], a[2], a[3], a[4], a[5]);
            break;
        case 7:
            result = new clazz(a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
            break;
        case 8:
            result = new clazz(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
            break;
        case 9:
            result = new clazz(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
            break;
        case 10:
            result = new clazz(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
            break;
        default:
            result = new clazz();
    }

    return result;
}
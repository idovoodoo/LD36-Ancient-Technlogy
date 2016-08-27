package ld36.gentorang.com;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;
import flixel.input.FlxInput.FlxInputState;
/**
 * Game menu
 */
class MenuState extends FlxState
{
	//private vars
	private var _txtTitle:FlxText;
	private var _txtPlay:FlxText;
	private var _txtCredits:FlxText;
	private var _menuOption:Int = 0;
	private var _isKeyDown:Bool = false;
	
	/**
	 * Constructor
	 */
	override public function create():Void
	{
		//create scene objects
		_txtTitle = new FlxText(0, 0, 0, "Ancient Technology", 26, true);
		_txtPlay = new FlxText(0, 0, 0, "Play", 26, true);
		_txtCredits = new FlxText(0, 0, 0, "Credits", 26, true);
		
		//add objects to scene
		this.add(_txtTitle);
		this.add(_txtPlay);
		this.add(_txtCredits);
		
		//position objects
		_txtTitle.setPosition((FlxG.width / 2) - (_txtTitle.width / 2), 50);
		_txtPlay.setPosition((FlxG.width / 2) - (_txtPlay.width / 2), FlxG.height / 2);
		_txtCredits.setPosition((FlxG.width / 2) - (_txtCredits.width / 2), (FlxG.height / 2 ) + 50);
		
		super.create();
	}
	
	/**
	 * Changes the current menu item
	 */
	private function menuSelect():Void
	{
		//update menu select colour
		switch (_menuOption) 
		{
			case 0: _txtPlay.color = FlxColor.GREEN;
					_txtCredits.color = FlxColor.WHITE;
			case 1: _txtPlay.color = FlxColor.WHITE;
					_txtCredits.color = FlxColor.GREEN;
		}
		
		//key listeners
		var _up:Bool = false;
		var _down:Bool = false;
		_up 	= FlxG.keys.anyJustPressed([UP, W]);
		_down	= FlxG.keys.anyJustPressed([DOWN, S]);		
		
		//cancel opposing directions
		if (_up && _down)
			_up = _down = false;
		
		//check if key is already down
		if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W || FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S)
		{
			//update the menu item
			if (_up)
				_menuOption++;
			else if (_down)
				_menuOption--;
				
			if (_menuOption > 1)
				_menuOption = 0;
			if (_menuOption < 0)
				_menuOption = 1;
		}
		
		//change to the selected menu item
		if (FlxG.keys.anyJustPressed([ENTER, SPACE]))
		{
			switch (_menuOption) 
			{
				case 0: FlxG.switchState(new PlayState());
				case 1: FlxG.switchState(new CreditState());
			}
		}
		
	}
	
	/**
	 * Game update
	 * @param	elapsed
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		menuSelect();
	}
}
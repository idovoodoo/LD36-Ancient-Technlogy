package ld36.gentorang.com;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxFrame;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;
using flixel.tweens.FlxTween;
using flixel.tweens.FlxEase;
 
/**
 * ...
 * @author idovoodoo
 */
class HUD extends FlxTypedGroup<FlxSprite>
{
	//private vars
	private var _sprBack:FlxSprite;
	private var _sprHealth:FlxSprite;
    private var _txtScore:FlxText;
	private var _txtHiScore:FlxText;
	private var _fire1:FlxSprite;
	private var _fire2:FlxSprite;
	private var _fire3:FlxSprite;
	
	public function new() 
	{
		super();
		//_sprBack = new FlxSprite().makeGraphic(FlxG.width, 60, FlxColor.BLACK);
		_sprBack = new FlxSprite();
		_sprBack.loadGraphic(AssetPaths.hudbar__png, false, 960, 60);
		_sprBack.setPosition(0, FlxG.height - 60);
		this.add(_sprBack);
		
		_txtScore = new FlxText(20, FlxG.height - 42, 0, "SCORE: ", 18, true);
		this.add(_txtScore);
		
		_fire1 = new FlxSprite();
		_fire1.loadGraphic(AssetPaths.fire1__png, false, 40, 40);
		_fire1.setPosition((FlxG.width / 2) - 75, FlxG.height - 50);
		this.add(_fire1);
		
		_fire2 = new FlxSprite();
		_fire2.loadGraphic(AssetPaths.fire2__png, false, 40, 40);
		_fire2.setPosition((FlxG.width / 2) - (_fire2.width / 2), FlxG.height - 50);
		this.add(_fire2);
		
		_fire3 = new FlxSprite();
		_fire3.loadGraphic(AssetPaths.fire3__png, false, 40, 40);
		_fire3.setPosition((FlxG.width / 2) + 35, FlxG.height - 50);
		this.add(_fire3);
		
		//stop all objects in this group from moving
		forEach(function(spr:FlxSprite)
        {
             spr.scrollFactor.set(0, 0);
        });
	}
	
	/**
	 * Update the HUD with info
	 * @param	Health
	 * @param	Score
	 */
	public function updateHUD(Health:Int = 0, Score:Int = 0):Void
	{
		_txtScore.text = Std.string("SCORE: " + Score);
	}
	
	/**
	 * Changes the graphic on the action button
	 * @param	Ready
	 */
	public function fire1State(Ready:Bool):Void
	{
		if (Ready)
		{
			_fire1.color = FlxColor.WHITE;
			
		}
		else
		{
			_fire1.color = FlxColor.GRAY;
		}
	}
	
	/**
	 * Changes the graphic on the action button
	 * @param	Ready
	 */
	public function fire2State(Ready:Bool):Void
	{
		if (Ready)
		{
			_fire2.color = FlxColor.WHITE;
		}
		else
		{
			_fire2.color = FlxColor.GRAY;
		}
	}
	
	/**
	 * Changes the graphic on the action button
	 * @param	Ready
	 */
	public function fire3State(Ready:Bool):Void
	{
		if (Ready)
		{
			_fire3.color = FlxColor.WHITE;
		}
		else
		{
			_fire3.color = FlxColor.GRAY;
		}
	}
}
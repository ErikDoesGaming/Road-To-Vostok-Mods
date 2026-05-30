How to make Road To Vostok Mods -

Download VMB (Vostok Mod Builder) 
Link for VMB: https://github.com/ScriptExec/vmb/releases

GitHub RTV Modding Guides:

- https://github.com/ametrocavich/vostok-mod-loader/wiki

- https://github.com/ametrocavich/vostok-modding-wiki/wiki


How to use VMB:

VMB is a CLI tool, not a GUI app. You need to run it from a terminal (Command Prompt or PowerShell)

1. Use Win + R and type in CMD
2. Set the filepath to the directory where you have VMB installed. Example: cd C:\Users\TestUser\Downloads\vmb-x86_64-pc-windows-msvc
3. Next enter this command .\vmb --help 

Creating a new VMB mod project.

1. After following the steps listed above and navigating to your install directory for VMB using CMD or PowerShell. Use: vmb init "My Mod Name" to create your new mod folder with the mod boilerplate.
2. After Step 1 for creating your new mod. Navigate to your VMB install directory and you should see a folder inside called "My Mod Name" or what ever name you chose for your mod. And it will have the boilerplate files ready for you to configure.

Example Mod that I made using this method.

Infinite Stamina Mod:

In this mod we using the Character.gd script which is responsible for arm and body stamina in game. We are taking the arm and body stamina values and keeping them pinned at 100 every frame.

This is our mod.txt 

[mod]
name = "Infinite Stamina"
id = "infinite-stamina"
version = "0.1.0"

[autoload]
InfiniteStamina = "res://mods/InfiniteStamina/Main.gd"


So our Main.gd script looks like this 

extends Node

var gameData = preload("res://Resources/GameData.tres")

func _ready():
	print("Infinite Stamina loaded!")

func _process(_delta):
	gameData.bodyStamina = 100.0
	gameData.armStamina = 100.0

----------------------------------------------------------------------------------------------------------------------------

Now that the mod is made we open up CMD or PowerShell again and type in these commands and run them one at a time in order.

cd "C:\Users\TestUser\Downloads\vmb-x86_64-pc-windows-msvc\Infinite Stamina"

..\vmb pack -o InfiniteStamina.vmz


Final Step: Install your mod to C:\Program Files (x86)\Steam\steamapps\common\Road to Vostok\mods
And test your new mod.

If you ever get stuck you should look at other peoples mods and you can open up mods and view them easily via making a copy of their mod. Make sure that you have file extensions visible on Windows 11 file explorer. Take their mod and rename it from InfiniteStamina.vmz to InfiniteStamina.zip and you can view the internal contents of the mod

For Debugging Your Mods go to C:\Users\TestUser\AppData\Roaming\Road to Vostok\logs -> godot.log






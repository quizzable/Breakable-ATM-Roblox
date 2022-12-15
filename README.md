# Breakable-ATM-Roblox
A breakable ATM that breaks when punched and drops money

HOW TO USE

Open Roblox Studio and create a new game or open an existing one.
In the Explorer window on the left side of the screen, click on the "Insert" tab and then click on "Object" to insert a new object into the game.
Select the new object and rename it to "ATM" in the Properties window on the right side of the screen.
In the Explorer window, click on the "Workspace" folder to view its contents.
Right-click on the "Workspace" folder and select "Insert" and then "Script" to create a new script in the game.
Double-click on the new script to open it in the Script Editor window.
Copy the code from above and paste it into the Script Editor.
In the Explorer window, click on the "Players" folder and then on the "Player" folder inside of it to view the player objects in the game.
Right-click on the "Player" folder and select "Insert" and then "Object" to create a new object in the player's inventory.
Select the new object and rename it to "Wallet" in the Properties window.
In the Explorer window, double-click on the "Wallet" object to open it in the Script Editor.
Go to "Wallet Script" and paste the script it in the script editor


HOW THE MONEY WORKS

In the script, the money is represented by a model object with several part objects inside of it. Each part represents a bill of money, and the model itself represents the bundle of money that is dropped on the ground.

First, a new model object is created and named "Money". Then, a random value is chosen between 100 and 300 to determine the total amount of money to drop. A loop is used to create several part objects, each representing a bill of money. The parts are added to the "Money" model and are positioned at the same location as the ATM. Finally, the "Money" model is added to the game's workspace, which makes it appear in the game.

Although the script does not include a specific model for the money, the part objects that are created can be seen and interacted with in the game. Players can pick up the money by clicking on it, and the money will go into the players wallet if followed instustions from line 15 down if not money will just disappear from the game once it is picked up.

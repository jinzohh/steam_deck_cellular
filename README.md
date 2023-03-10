Check out full instructions on Instructables at https://www.instructables.com/Making-Steam-Deck-Completely-Mobile-With-Cellular-/.

Installing LEMBAS on Steam Deck:

This is a guide on how to enable 4G/LTE high speed internet on Steam Deck using TE's LEMBAS USB Modem. You can purchase this from Digi-Key or Mouser.
1. Digi-Key: https://www.digikey.com/en/products/detail/te-connectivity-amp-connectors/2195873-1/16615625?s=N4IgTCBcDaIDYFMC2AjAhgZxAXQL5A
2. Mouser: https://www.mouser.com/ProductDetail/TE-Connectivity/2195873-1?qs=4ASt3YYao0XBsly1%252BNgWoQ%3D%3D

Data Plan Set-up:  
The steps to purchase data plan is the same as indicated on the instructions manual when you purchase the product.
1. Go to https://lembas.luner.io.
2. Create an account or log in.
3. After successfully creating an account or logging in, click on "Provision SIM" on the top right side.
4. Enter SIM number which is printed on the label on the back of the device (3rd line from the top indicated as "SIM No.").
5. Choose data plan.
6. Review and confirm order to activate data plan.

Device Set-up:
1. Press on STEAM buttom on bottom left of console, then "Power", then "Switch to Desktop".
2. Make sure you are connected to WiFi.
3. Open Konsole. If you cannot find it, click on Application Launcher at the bottom left corner of the screen (Start button equivalent on Windows), and type "Konsole" in the search bar.
4. Clone the git repository by entering <code>git clone https://github.com/jinzohh/steam_deck_cellular.git</code>.  
   Make sure to be in the "/home/deck" directory which is the default directory when you open Konsole.
5. Disable WiFi (bottom right corner of screen and uncheck the WiFi icon).
6. Connect the LEMBAS to the USB-C port of the Steam Deck using an adapter (USB-A to USB-C) or to a dock if you have one.
7. Change directory into "steam_deck_cellular" by entering <code>cd steam_deck_cellular</code>.
8. Finally, enter <code>bash activate_cell.sh</code>, and then reboot the system when prompted to do so.
9. Now the LEMBAS modem works as plug-and-play! Steam Deck is completely mobile!

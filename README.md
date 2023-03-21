**Inventory Management System**
This is a bash script that provides a simple inventory management system for tracking the movement of products in a workplace. The script allows users to add new products, delete products, update existing products, and find products by search term.

**Usage**
The script takes one argument, which is the path to the inventory file to be used. If the inventory file does not exist, the script will create it.

**bash**
Copy code
./productControl.sh /path/to/inventory_file
Dependencies
This script depends on the figlet utility for generating ASCII art text. If figlet is not installed, the script will not work properly.

**Functions**
add_product
This function prompts the user for information about a new product and adds it to the inventory file. If the product already exists in the inventory, the function updates its quantity and price.

delete_product
This function prompts the user for the name of a product to delete and removes it from the inventory file.

update_product
This function prompts the user for the name of a product to update and new values for its SKU, quantity, and price. The function then updates the product in the inventory file.

find_product
This function prompts the user for a search term and returns a list of all products in the inventory that match the term. If there is only one match, the user is given the option to add, delete, or update the product.

while true loop
This loop repeatedly displays a menu of options for the user to select from. The user can add a new product, delete a product, update a product, find a product, or exit the script.

**Logging**
All operations performed by the script are logged to a file named log.txt in the same directory as the inventory file.

**Author**
This script was written by Hatem Aliyan. If you have any questions or feedback, you can email me at hatimelyan@gmail.com.

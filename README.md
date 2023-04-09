# Description
This Bash script is an inventory management system that allows the user to add, delete, update, or find products in an inventory file.

# Usage
To use the script, follow the steps below:

1- Save the script with a name and extension .sh.

2- Open a terminal or command prompt and navigate to the directory where the script is saved.

3- Run the script by typing ./product_control.sh inventoryfile.txt and press enter.

Note: Replace scriptname.sh with the actual name of the script and inventoryfile.txt with the name of your inventory file.

4-The script will display a welcome message and a menu with options to add, delete, update or find a product.

5- Choose an option by typing the corresponding number and press enter.

6- Follow the prompts and enter the necessary information to perform the chosen operation.

7- Repeat steps 5 and 6 until you choose the "Exit" option.

8- To view the log of operations performed, open the log.txt file in the same directory as the script.

# Features
The script offers the following features:

Add a new product to the inventory file.
Delete a product from the inventory file.
Update an existing product in the inventory file.
Find a product in the inventory file.

# Dependencies
In addition to the figlet package, the following dependencies are required to run this script:

Bash: This script is written in Bash, so a Bash interpreter must be installed on the system.
A valid inventory file: The script takes the path to an inventory file as an argument. The file must already exist and have a .csv extension.
sed: This tool is used to manipulate the inventory file.
grep: This tool is used to search for specific strings in the inventory file.
cut: This tool is used to extract specific columns from the inventory file.
read: This command is used to read input from the user.
printf: This command is used to print formatted output to the console.
date: This command is used to get the current date and time to log operations.
An editor or command-line interface to create or modify the inventory file.

# License
This script is licensed under the MIT license.

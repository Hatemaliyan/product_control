#!/bin/bash

figlet -f slant -c "productControl" && figlet -f digital -c "Track product's workplace movements"
echo "# Written by: HatemAliyan | Email: hatimelyan@gmail.com"
# Define variables
INVENTORY_FILE="$1"
LOG_FILE="log.txt"

# Define functions
function add_product {
    read -p "Enter the name of the product: " product_name
    read -p "Enter the quantity to be added: " quantity
    read -p "Enter the price: " price

    if grep -q "^$product_name," "$INVENTORY_FILE"; then
        sed -i "s/^$product_name,.*/$product_name,$((quantity+$(grep "^$product_name," "$INVENTORY_FILE" | cut -d',' -f3)),$price)/" "$INVENTORY_FILE"
        echo "Product updated: $product_name, $((quantity+$(grep "^$product_name," "$INVENTORY_FILE" | cut -d',' -f3))), $price"
    else
        echo "$product_name,$quantity,$price" >> "$INVENTORY_FILE"
        echo "Product added: $product_name, $quantity, $price"
    fi

    # Log the operation
    echo "$(date) - Added product: $product_name, $quantity, $price" >> "$LOG_FILE"
}

function delete_product {
    # Prompt the user for input
    read -p "Enter the name of the product: " product_name

    # Check if the record exists
    if grep -q "^$product_name," "$INVENTORY_FILE"; then
        sed -i "/^$product_name,/d" "$INVENTORY_FILE"
        echo "Product deleted: $product_name"
        # Log the operation
        echo "$(date) - Deleted product: $product_name" >> "$LOG_FILE"
    else
        # Product doesn't exist
        echo "Product not found: $product_name"
    fi
}

function update_product {
    read -p "Enter the name of the product to update: " product_name

    # Check if the product exists
    if grep -q "^$product_name," "$INVENTORY_FILE"; then
        read -p "Enter the new quantity: " quantity
        read -p "Enter the new price: " price
        sed -i "s/^$product_name,.*/$product_name,$quantity,$price/" "$INVENTORY_FILE"
        echo "Product updated: $product_name, $quantity, $price"
        # Log the operation
        echo "$(date) - Updated product: $product_name, $quantity, $price" >> "$LOG_FILE"
    else
        # Product doesn't exist
        echo "Product not found: $product_name"
    fi
}

function find_product {
    read -p "Enter search term: " search_term

    matches=($(grep -i "$search_term" "$INVENTORY_FILE"))

    if [ ${#matches[@]} -eq 0 ]; then
        echo "No matches found."
    elif [ ${#matches[@]} -eq 1 ]; then
        echo "Found one match:"
        echo "${matches[0]}"
        read -p "Do you want to add, delete or update this product? (a/d/u) " action
        if [ "$action" = "a" ]; then
            add_product
        elif [ "$action" = "d" ]; then
            delete_product
        elif [ "$action" = "u" ]; then
            update_product
        else b
            echo "Invalid"
        fi  # add this statement to close the else block
    else
        echo "Multiple matches found:"
        printf '%s\n' "${matches[@]}"
    fi
}
while true; do
    echo "Welcome to the inventory management system!"
    echo

    # Display menu options
    options=("Add a new product" "Delete a product" "Update a product" "Find a product" "Exit")
    select choice in "${options[@]}"; do
        case $choice in
            "Add a new product")
                add_product
                break
                ;;
            "Delete a product")
                delete_product
                break
                ;;
            "Update a product")
                update_product
                break
                ;;
            "Find a product")
                find_product
                break
                ;;
            "Exit")
                exit 0
                ;;
            *) echo "Invalid option. Please select a valid number." ;;
         esac
    done

    echo
done         
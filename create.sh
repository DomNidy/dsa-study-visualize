#!/bin/bash

# Top level directory that we should instantiate the projects into
PROJECT_DIR_NAME=('projects')

# Registry (location) of data structure template files
DATA_STRUCTURE_REGISTRY=('./0-data-structures')

# Data structure templates
# (must match the name of the files in the data structure registry)
DATA_STRUCTURE_TEMPLATES=('digraph' 'udgraph' 'binarytree')

# Call this when invalid arguments (or 'help') are passed
function show_help() {
    echo "Usage: ${0} <data_structure>"
    echo "Generates python project files for visualizing data structures."
    echo "Each generated project contains the boilerplate needed for the desired data structure."
    printf "\nExample: '${0} digraph' creates a folder named with the current date,\n"
    printf "          and containing the boilerplate code to visualize a directed graph\n\n"

    echo "Supported data structures:"
    for data_structure in "${DATA_STRUCTURE_TEMPLATES[@]}"; do
        echo "    ${data_structure}"
    done
    exit 1
}

# Check if the provided argument is a valid data structure
function is_valid_data_structure() {
    for data_structure in "${DATA_STRUCTURE_TEMPLATES[@]}"; do
        if [[ "${1}" == "${data_structure}" ]]; then
            return 0
        fi
    done
    return 1
}

if [[ -z "${1}" ]] || [[ "${1}" == "help" ]]; then
    show_help
    exit 1
fi

# Generate the name for the projects each month
function generate_monthly_dir_name() {
    date '+%Y-%m'
}

# Generates name for the template after it is copied
function generate_timestamp() {
    date '+%H-%M-%S' # Time in HH-MM-SS format
}

# Check if a valid data structure is provided
if ! is_valid_data_structure "${1}"; then
    show_help
    echo "Invalid data structure. Please choose one of: ${DATA_STRUCTURE_TEMPLATES[*]}"
    exit 1
fi

# Generate project directory name
new_dir_name=$(generate_monthly_dir_name)

# Check that the top level projects directory exists
# if not, create one
if ! [ -d "${PROJECT_DIR_NAME}" ]; then
    echo "Could not find a projects directory at location '${PROJECT_DIR_NAME}', creating one..."
    mkdir ${PROJECT_DIR_NAME}
fi

# Create new directory if it doesnt exist
if ! [ -d "${PROJECT_DIR_NAME}/${new_dir_name}" ]; then
    mkdir "${PROJECT_DIR_NAME}/${new_dir_name}"
fi

# Copy template files based on user input
template_file="${DATA_STRUCTURE_REGISTRY}/${1}.ipynb"
cp "${template_file}" "${PROJECT_DIR_NAME}/${new_dir_name}/$(generate_timestamp)-${1}.ipynb"
echo "Copied template file ${template_file} to ${PROJECT_DIR_NAME}/${new_dir_name}/${1}.ipynb"

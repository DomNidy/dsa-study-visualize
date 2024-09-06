# dsa-study-visualize

This project aims to automate the process of visualizing data structures. While studying DS&A, if you wish to visualize data structures, you may need to write your own boilerplate and wrestle with libraries. This burdens the learning process and introduces extraneous cognitive load, resulting in less effective studying.

## Supported language and dependencies

I plan only to support **Python** through [Jupyter notebooks](https://jupyter.org/). Additionally, you will also need to install the dependencies used in the templates yourself. For instance, the graph visualizations use the **networkx** and **matplotlib** libraries.

## What it does

The script (`create.sh`) provides a simple way to generate a project with the necessary boilerplate to visualize data structures. You can modify this script to your liking, and add new data structures/customize naming conventions. I wanted this project to be as extensible as possible, so I decided on using bash in preference of building a "proper" CLI program. The directories and paths this scripts point to are defined in variables at the top of the script in `SCREAMING_SNAKE_CASE`.

## Generated project structure

Generated projects are organized into subdirectories within the top level `/projects` directory. By default, each of these subdirectories contain the instantiated templates for a month. The names of these "monthly" subdirectories are of the format **YYYY-mm**. The names of the instantiated template files are of the format **HH-MM-SS**.

### Example `/projects` structure

```sh
projects/
└── 2024-09
    ├── 09-46-33-digraph.ipynb
    └── 09-49-45-udgraph.ipynb
```

## Example

### Instantiate directed graph project template

```sh
./create digraph
```

## Supported data structures

- Undirected graphs
- Directed graphs
- Binary trees

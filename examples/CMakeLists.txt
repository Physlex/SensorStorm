# This file sets up the monorepo build system for the examples directory.

project(Examples)

# GLOB All examples into a list of example outputs
file(GLOB_RECURSE EXAMPLES_SRC "*.cpp")

# Loop through each example and create a build for each, linking the weatherstation
foreach(EXAMPLE_FILE ${EXAMPLES_SRC})
    get_filename_component(EXAMPLE_NAME ${EXAMPLES_SRC} NAME_WE)
    add_executable(${EXAMPLE_NAME} ${EXAMPLE_FILE})
endforeach()
